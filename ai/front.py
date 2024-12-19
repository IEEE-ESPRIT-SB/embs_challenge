#client-side main.py
import streamlit as st
import requests
import json
import os
from datetime import datetime


def load_questions(file_path='questions.json'):
    """
    Load questions from a JSON file.
    
    Args:
        file_path (str): Path to the JSON file containing questions
    
    Returns:
        list: List of sections with their questions
    """
    try:
        with open(file_path, 'r') as f:
            return json.load(f)['sections']
    except FileNotFoundError:
        st.error(f"Questions file not found at {file_path}")
        return []
    except json.JSONDecodeError:
        st.error(f"Invalid JSON in {file_path}")
        return []

def generate_input_for_question(question):
    """
    Generate appropriate Streamlit input based on question type.
    
    Args:
        question (dict): Question details from JSON
    
    Returns:
        The value selected/entered by the user
    """
    # Determine input type based on question type
    if question['type'] == 'number':
        # Check if validation exists
        kwargs = {}
        if 'validation' in question:
            if 'min' in question['validation']:
                kwargs['min_value'] = question['validation']['min']
            if 'max' in question['validation']:
                kwargs['max_value'] = question['validation']['max']
        
        return st.sidebar.number_input(question['question'], **kwargs)
    
    elif question['type'] == 'qcu':  # Question with Closed Unique answer
        return st.sidebar.selectbox(question['question'], question['options'])
    
    elif question['type'] == 'yes_no':
        return st.sidebar.selectbox(question['question'], ['Yes', 'No'])
    
    else:
        # Fallback for unknown types
        st.warning(f"Unsupported question type: {question['type']}")
        return None

def generate_mental_health_report(survey_responses, additional_context=""):
    """
    Send survey responses to the FastAPI endpoint and retrieve the mental health report.
    
    Args:
        survey_responses (dict): Dictionary of survey responses
        additional_context (str, optional): Additional context for the report
    
    Returns:
        tuple: Generated user_id and report, or error message
    """
    # FastAPI endpoint URL - replace with your actual endpoint
    endpoint_url = "http://localhost:8000/generate-mental-health-report"
    
    # Prepare the payload
    payload = {
        "survey_responses": survey_responses,
        "additional_context": additional_context
    }
    
    try:
        # Send POST request to the endpoint
        response = requests.post(endpoint_url, json=payload)
        
        # Check if the request was successful
        if response.status_code == 200:
            data = response.json()
            return data.get('user_id'), data.get('report', 'No report generated')
        else:
            return None, f"Error: {response.status_code} - {response.text}"
    
    except requests.RequestException as e:
        return None, f"Request failed: {str(e)}"

def retrieve_mental_health_report(user_id):
    """
    Retrieve a previously generated mental health report.
    
    Args:
        user_id (str): Unique user ID for the report
    
    Returns:
        str: Retrieved mental health report
    """
    # FastAPI endpoint URL for report retrieval
    endpoint_url = "http://localhost:8000/retrieve-report"
    
    # Prepare the payload
    payload = {
        "user_id": user_id
    }
    
    try:
        # Send POST request to retrieve the report
        response = requests.post(endpoint_url, json=payload)
        
        # Check if the request was successful
        if response.status_code == 200:
            data = response.json()
            return data.get('report', 'No report found')
        else:
            return f"Error: {response.status_code} - {response.text}"
    
    except requests.RequestException as e:
        return f"Request failed: {str(e)}"


def get_weekly_tasks(user_id, user_data):
    """
    Get weekly tasks from the API based on user data.
    
    Args:
        user_id (str): User ID from the mental health report
        user_data (dict): User's personal information and preferences
    
    Returns:
        list: List of tasks or error message
    """
    endpoint_url = "http://localhost:8000/generate-weekly-tasks"
    
    try:
        # Send POST request to generate tasks
        response = requests.post(endpoint_url, json={
            "user_id": user_id,
            **user_data
        })
        
        # Check if request was successful
        if response.status_code == 200:
            data = response.json()
            
            return data.get('tasks', [])
        else:
            return f"Error: {response.status_code} - {response.text}"
    
    except requests.RequestException as e:
        return f"Request failed: {str(e)}"

def display_task(task):
    """
    Display a single task in a structured format.
    
    Args:
        task (dict): Task information
    """
    with st.expander(f"🎯 {task['task_title']} ({task['task_complexity']})"):
        st.write("**Description:**", task['task_description'])
        st.write("**Goal:**", task['task_goal'])
        col1, col2 = st.columns(2)
        with col1:
            st.write("**Schedule:**")
            st.write(f"- Reveal: Day {task['task_reveal_at']}")
            st.write(f"- Start: Day {task['task_start_at']}")
        with col2:
            st.write("**Deadlines:**")
            st.write(f"- Due: Day {task['task_deadline_at']}")
            st.write(f"- Late submission: Day {task['task_late_submission_maximum_at']}")
        st.write(f"**Location:** {task['indoor_or_outdoor']}")
def main():
    # Set page configuration
    st.set_page_config(page_title="Mental Health Assessment", page_icon="🧠")
    
    # Create tabs for different functionalities
    tab1, tab2, tab3 = st.tabs(["Generate New Report", "Retrieve Existing Report", "Weekly Tasks"])
    
    with tab1:
        # Title of the application
        st.title("Comprehensive Mental Health Assessment")
        
        # Load questions from JSON
        sections = load_questions()
        
        if not sections:
            st.error("No questions could be loaded. Please check the questions.json file.")
            return
        
        # Sidebar for survey inputs
        st.sidebar.header("Mental Health Survey")
        
        # Create a dictionary to store survey responses
        survey_responses = {}
        
        # Iterate through each section and its questions
        for section in sections:
            # Add a subheader for each section
            st.sidebar.subheader(section['name'])
            
            # Process questions in the section
            for question in section['questions']:
                # Generate input and store the response
                survey_responses[question['question']] = generate_input_for_question(question)
        
        # Additional Context input
        additional_context = st.sidebar.text_area(
            "Additional Context (Optional)", 
            "Please provide any additional information that might help in your assessment.",
            key="additional_context_tab1"
        )
        
        # Generate Report Button
        if st.sidebar.button("Generate Mental Health Report", key="generate_report_btn"):
            with st.spinner('Generating your personalized mental health report...'):
                # Generate the report
                user_id, report = generate_mental_health_report(survey_responses, additional_context)
                
                if user_id:
                    # Display the report
                    st.header("Your Personalized Mental Health Assessment")
                    st.write(report)
                    
                    # Display the User ID
                    st.success(f"Your unique User ID is: {user_id}")
                    st.warning("Please save this ID to retrieve your report later.")
                    
                    # Option to download the report
                    st.download_button(
                        label="Download Report",
                        data=report,
                        file_name="mental_health_report.txt",
                        mime="text/plain",
                        key="download_report_btn"
                    )
                else:
                    st.error(report)
    
    with tab2:
        # Report Retrieval Section
        st.title("Retrieve Existing Mental Health Report")
        
        # Input for User ID
        retrieved_user_id = st.text_input("Enter your User ID", key="retrieve_user_id")
        
        # Retrieve Report Button
        if st.button("Retrieve Report", key="retrieve_report_btn"):
            if retrieved_user_id:
                with st.spinner('Retrieving your mental health report...'):
                    # Retrieve the report
                    retrieved_report = retrieve_mental_health_report(retrieved_user_id)
                    
                    # Display the retrieved report
                    st.header("Retrieved Mental Health Report")
                    st.write(retrieved_report)
                    
                    # Option to download the retrieved report
                    st.download_button(
                        label="Download Retrieved Report",
                        data=retrieved_report,
                        file_name="retrieved_mental_health_report.txt",
                        mime="text/plain",
                        key="download_retrieved_report_btn"
                    )
            else:
                st.warning("Please enter a valid User ID")
    with tab3:
        # Weekly Tasks Section
        st.title("Generate Weekly Tasks")
        
        # User ID input
        user_id = st.text_input("Enter your User ID", key="tasks_user_id")
        
        if user_id:

                # Submit button
            submit_button = st.button("Generate Tasks")
            
            # Move task generation and display logic outside the form
            if submit_button:
                # Prepare user data
                user_data = {
                    "completed_tasks": [],
                    "procrastinated_tasks": [],
                    "user_feedback": ""
                }
                
                # Generate tasks
                with st.spinner('Generating your personalized weekly tasks...'):
                    tasks = get_weekly_tasks(user_id, user_data)
                    
                    if isinstance(tasks, list):
                        st.success("Weekly tasks generated successfully!")
                        
                        # Display tasks grouped by complexity
                        complexities = ["Easy", "Medium", "Hard"]
                        for complexity in complexities:
                            filtered_tasks = [t for t in tasks if t['task_complexity'] == complexity]
                            if filtered_tasks:
                                st.subheader(f"{complexity} Tasks")
                                for i, task in enumerate(filtered_tasks):
                                    with st.expander(
                                        f"🎯 {task['task_title']} ({task['task_complexity']})"
                                    ):
                                        st.write("**Description:**", task['task_description'])
                                        st.write("**Goal:**", task['task_goal'])
                                        col1, col2 = st.columns(2)
                                        with col1:
                                            st.write("**Schedule:**")
                                            st.write(f"- Reveal: Day {task['task_reveal_at']}")
                                            st.write(f"- Start: Day {task['task_start_at']}")
                                        with col2:
                                            st.write("**Deadlines:**")
                                            st.write(f"- Due: Day {task['task_deadline_at']}")
                                            st.write(f"- Late submission: Day {task['task_late_submission_maximum_at']}")
                                        st.write(f"**Location:** {task['indoor_or_outdoor']}")
                        
                        # Download button outside the form
                        st.download_button(
                            label="Download Tasks",
                            data=json.dumps(tasks, indent=2),
                            file_name="weekly_tasks.json",
                            mime="application/json",
                            key="download_tasks_btn"
                        )
                    else:
                        st.error(tasks)  # Display error message
        else:
            st.warning("Please enter your User ID to generate weekly tasks")

if __name__ == "__main__":
    main()