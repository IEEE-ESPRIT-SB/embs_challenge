#server-side main.py
import json
import uuid
from fastapi import FastAPI, HTTPException, Request
from pydantic import BaseModel
import google.generativeai as genai
import os
from typing import Dict, Optional, List
from datetime import datetime, timedelta
import requests

# Add OpenWeather API key
OPENWEATHER_API_KEY = "de818e8afef60a21ccf5025b6fcc3faf"
GOOGLE_API_KEY = "AIzaSyD2L2LnpS3cW-ih1UtSXwljLGX-5JiLBJY"

# Configure the Gemini API
genai.configure(api_key=GOOGLE_API_KEY)

# Create FastAPI app
app = FastAPI()

# In-memory storage for reports (in production, use a database)
class ReportStorage:
    def __init__(self):
        # Dictionary to store reports with expiration
        self._reports = {}
        # Reports will expire after 30 days
        self._expiration_days = 30
    
    def save_report(self, survey_responses: Dict, report: str) -> str:
        """
        Save a report and generate a unique user ID
        
        Args:
            survey_responses (dict): Survey responses used to generate the report
            report (str): Generated mental health report
        
        Returns:
            str: Unique user ID for the report
        """
        # Generate a unique user ID
        user_id = str(uuid.uuid4())
        
        # Store the report with an expiration timestamp
        self._reports[user_id] = {
            'report': report,
            'survey_responses': survey_responses,
            'created_at': datetime.now(),
            'expiration': datetime.now() + timedelta(days=self._expiration_days)
        }
        
        return user_id
    
    def get_report(self, user_id: str) -> Optional[Dict]:
        """
        Retrieve a report by user ID
        
        Args:
            user_id (str): Unique user ID
        
        Returns:
            Optional[Dict]: Report details or None if not found
        """
        # Remove expired reports
        self._cleanup_expired_reports()
        
        # Retrieve the report
        report_entry = self._reports.get(user_id)
        return report_entry
    
    def _cleanup_expired_reports(self):
        """
        Remove reports that have expired
        """
        current_time = datetime.now()
        expired_keys = [
            key for key, value in self._reports.items() 
            if value['expiration'] <= current_time
        ]
        
        for key in expired_keys:
            del self._reports[key]


class WeeklyTaskRequest(BaseModel):
    user_id: str
    completed_tasks: Optional[List[str]] = []
    procrastinated_tasks: Optional[List[str]] = []
    user_feedback: Optional[str] = ""

def get_weather_conditions():
    """
    Get weather conditions for Tunisia, Ariana using OpenWeather API
    """
    try:
        url = f"http://api.openweathermap.org/data/2.5/weather?q=Ariana,TN&appid={OPENWEATHER_API_KEY}"
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            weather_main = data['weather'][0]['main']
            temp = data['main']['temp'] - 273.15  # Convert to Celsius
            
            # Determine indoor/outdoor suitability
            unsuitable_conditions = ['Rain', 'Snow', 'Thunderstorm', 'Extreme']
            if weather_main in unsuitable_conditions or temp > 35 or temp < 10:
                return "Indoor preferred"
            else:
                return "Both suitable"
        return "Weather data unavailable"
    except Exception as e:
        return "Weather data unavailable"

def create_weekly_tasks_prompt(report_data: Dict, request: WeeklyTaskRequest) -> str:
    """
    Create the prompt for generating weekly tasks
    """
    # Extract issues from the report (this is a simplified example - you'll need to
    # adjust based on your actual report structure)
    
    weather_conditions = get_weather_conditions()
    
    return f"""You are an assistant helping users build healthy habits and address mental health issues. Your goal is to create a personalized list of tasks for the next week, considering the user's detected challenges, preferences, and lifestyle.

### Input Data
1. Diagnostic Report:
    \"\"\"
    {report_data['report']}
    \"\"\"
2. Feedback on Previous Tasks:
    - Completed tasks: {', '.join(request.completed_tasks) if request.completed_tasks else 'First week'}
    - Procrastinated tasks: {', '.join(request.procrastinated_tasks) if request.procrastinated_tasks else 'First week'}
    - User feedback: {request.user_feedback if request.user_feedback else 'First week'}
3. Weather Conditions:
    - Indoor/outdoor suitability: {weather_conditions}

### Task Generation Requirements
- Balance complexity: Adjust difficulty based on user feedback
- Focus on improvement: Address detected issues while promoting general well-being
- Personalization: Tailor tasks to fit user's lifestyle and preferences
- Engagement: Ensure tasks are achievable but engaging
- Redundancy: A task can be copied across several days or over a period of time with the purpose of creating discipline (e.g., going to the gym, waking up early, etc.).
- The task life cycle adjustment: The task_reveal_at is usually at least an hour before task_start_at, and the task_late_submission_maximum_at is typically at least an hour after task_deadline_at 
### Output Format
Generate a JSON array of tasks . Format each task exactly as shown below:
[
  {{
    "task_title": "Task title here",
    "task_description": "Detailed explanation",
    "task_goal": "Primary goal",
    "task_complexity": "Easy|Medium|Hard",
    "task_reveal_at": "Day number, HH:MM",
    "task_start_at": "Day number, HH:MM",
    "task_deadline_at": "Day number, HH:MM",
    "task_late_submission_maximum_at": "Day number, HH:MM",
    "indoor_or_outdoor": "Indoor|Outdoor"
  }}
  and then add today date "{datetime.now()}" to the day number of each date field of each task
]"""

@app.post("/generate-weekly-tasks")
async def generate_weekly_tasks(request: WeeklyTaskRequest):
    try:
        # Retrieve the saved report
        report_entry = report_storage.get_report(request.user_id)
        if not report_entry:
            raise HTTPException(status_code=404, detail="Report not found or expired")
        
        # Initialize the Gemini model
        generation_config = {
          "temperature": 1,
          "top_p": 0.95,
          "top_k": 40,
          "max_output_tokens": 8192,
          "response_mime_type": "application/json",
        }

        model = genai.GenerativeModel(
          model_name="gemini-1.5-flash",
          generation_config=generation_config,
        )
        
        # Create the prompt
        prompt = create_weekly_tasks_prompt(report_entry, request)
        
        # Generate the tasks
        response = model.generate_content(prompt)
        # Parse the response as JSON
        tasks = json.loads(response.text)
        
        # Return the generated tasks
        return {
            "tasks": tasks,
            "status": "success"
        }
    
    except json.JSONDecodeError:
        return {
            "error": "Failed to parse generated tasks",
            "status": "error"
        }
    except Exception as e:
        return {
            "error": str(e),
            "status": "error"
        }

# Initialize report storage
report_storage = ReportStorage()

# Pydantic models for request validation
class SurveyRequest(BaseModel):
    survey_responses: dict
    additional_context: str = ""

class ReportRetrieveRequest(BaseModel):
    user_id: str

def create_mental_health_prompt(survey_responses: dict, additional_context: str = "") -> str:
    """
    Create the mental health assessment prompt
    
    Args:
        survey_responses (dict): User's survey responses
        additional_context (str): Additional context provided by the user
    
    Returns:
        str: Prompt for mental health assessment
    """
    return f"""CONTEXT:
You are a compassionate mental health professional creating a personalized well-being assessment and support plan.

USER QUESTIONNAIRE RESPONSES:
{json.dumps(survey_responses, indent=2)}
{additional_context}

DIAGNOSIS REPORT GENERATION INSTRUCTIONS:
1. COMPREHENSIVE ASSESSMENT
- Analyze each section of the questionnaire
- Identify primary and secondary areas of concern
- Look for interconnected patterns in the responses

2. TONE AND APPROACH
- Use empathetic and supportive language
- Avoid medical jargon
- Focus on empowerment and positive change
- Provide hope and constructive guidance

3. RECOMMENDATIONS
- Suggest initial steps for each identified area of concern
- Recommend potential professional support if necessary
- Include self-care and lifestyle modification suggestions

4. CONFIDENTIALITY NOTE
- Emphasize that this is a preliminary assessment
- Recommend professional consultation for comprehensive treatment

OUTPUT FORMAT:
- Total Length: Approximately 1000 words
- Clear, readable sections
- Actionable insights
- Motivational tone

REPORT STRUCTURE
    1. EXECUTIVE SUMMARY
    - Brief overview of key mental health indicators
    - Snapshot of overall well-being status

    2. DETAILED FINDINGS
    - Categorize findings into major domains:
      * Emotional Well-being
      * Stress and Anxiety
      * Social Connections
      * Physical Health
      * Lifestyle Factors

    3. RISK ASSESSMENT
    - Highlight moderate to high-risk areas
    - Explain potential long-term implications if unaddressed

    4. 3-MONTH ROADMAP
    Create a strategic roadmap with:
    - Overarching Goal
    - 3-4 Primary Focus Areas
    - Key Milestone Objectives for Each Area
    - Estimated Time Allocation

SPECIAL INSTRUCTIONS:
- Prioritize psychological safety
- Highlight user's strengths alongside areas for improvement
- Create a roadmap that feels achievable and motivating"""

@app.post("/generate-mental-health-report")
async def generate_mental_health_report(request: SurveyRequest):
    try:
        print('---------')
        # Initialize the Gemini model
        model = genai.GenerativeModel('gemini-pro')
        
        # Create the prompt with survey responses
        prompt = create_mental_health_prompt(
            request.survey_responses, 
            request.additional_context
        )
        
        # Generate the report
        response = model.generate_content(prompt)
        
        # Save the report and get a user ID
        user_id = report_storage.save_report(
            survey_responses=request.survey_responses, 
            report=response.text
        )
        
        # Return the generated report and user ID
        return {
            "report": response.text,
            "user_id": user_id,
            "status": "success"
        }
    
    except Exception as e:
        # Handle any errors that might occur during API call
        return {
            "error": str(e),
            "status": "error"
        }

@app.post("/retrieve-report")
async def retrieve_mental_health_report(request: ReportRetrieveRequest):
    try:
        # Retrieve the report using the user ID
        report_entry = report_storage.get_report(request.user_id)
        
        if not report_entry:
            raise HTTPException(status_code=404, detail="Report not found or expired")
        
        # Return the report details
        return {
            "report": report_entry['report'],
            "survey_responses": report_entry['survey_responses'],
            "created_at": report_entry['created_at'].isoformat(),
            "status": "success"
        }
    
    except HTTPException:
        # Re-raise HTTP exceptions
        raise
    except Exception as e:
        # Handle any other unexpected errors
        return {
            "error": str(e),
            "status": "error"
        }

# Optional: Add a health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

# Note: To run this, you'll need to install:
# pip install fastapi google-generativeai python-dotenv uvicorn

# To run the server:
# uvicorn filename:app --reload