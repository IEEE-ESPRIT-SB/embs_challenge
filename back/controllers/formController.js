const axios = require('axios');
const Response = require('../models/responseModel');
const fs = require('fs');
const path = require('path');
// Static questions
const questions = [
    { id: 1, question: "What is your age?", type: "number" },
    { id: 2, question: "What is your gender?", type: "string" },
    { id: 3, question: "What is your height (in cm)?", type: "number" },
    { id: 4, question: "What is your weight (in kg)?", type: "number" },
    { id: 5, question: "What percentage of your daily activities are indoors?", type: "number" },
    { id: 6, question: "What percentage of your daily activities are outdoors?", type: "number" },
    { id: 7, question: "What is your availability for activities?", type: "string" },
    { id: 8, question: "Do you smoke?", type: "string" },
    { id: 9, question: "Do you drink alcohol?", type: "string" },
    { id: 10, question: "What is your relationship status?", type: "string" },
    { id: 11, question: "How often do you feel overwhelmed or unable to cope with daily tasks?", type: "string" },
    { id: 12, question: "Do you frequently feel nervous, restless, or tense without a clear reason?", type: "string" },
    { id: 13, question: "Do you find it hard to control your worries about the future?", type: "string" },
    { id: 14, question: "Have you lost interest in activities you used to enjoy?", type: "string" },
    { id: 15, question: "How often do you feel sad or hopeless?", type: "string" },
    { id: 16, question: "Do you often feel like you have low energy or fatigue?", type: "string" },
    { id: 17, question: "How often do you feel mentally exhausted or drained at the end of the day?", type: "string" },
    { id: 18, question: "Do you feel like your work or studies are taking over your personal life?", type: "string" },
    { id: 19, question: "Do you often feel disconnected from people around you?", type: "string" },
    { id: 20, question: "Do you feel like you don't have someone to talk to when you're feeling down?", type: "string" },
    { id: 21, question: "How often do you feel emotionally drained after spending time with certain people?", type: "string" },
    { id: 22, question: "Do you feel manipulated or controlled by someone close to you?", type: "string" },
    { id: 23, question: "Have you recently experienced a breakup or significant rejection?", type: "string" },
    { id: 24, question: "Do you find it hard to move on from a past relationship or rejection?", type: "string" },
    { id: 25, question: "Do you frequently dwell on past mistakes or events?", type: "string" },
    { id: 26, question: "How often do you criticize yourself for not being good enough?", type: "string" },
    { id: 27, question: "Do you find it hard to limit your screen time or social media use?", type: "string" },
    { id: 28, question: "How often do you rely on substances to relieve stress or feel better?", type: "string" },
    { id: 29, question: "Do you often have trouble falling asleep or staying asleep?", type: "string" },
    { id: 30, question: "How often do you wake up feeling rested?", type: "string" },
    { id: 31, question: "Do you feel physically inactive or sluggish most of the time?", type: "string" },
    { id: 32, question: "Do you often skip meals or eat unhealthy food due to lack of time or motivation?", type: "string" }
];


// Get static questions
exports.getQuestions = (req, res) => {
    res.status(200).json({ questions });
};


// Handle form submission
exports.submitForm = async (req, res) => {
    try {
        const formData = req.body;

        if (!formData || Object.keys(formData).length === 0) {
            return res.status(400).json({ error: 'Form data is required' });
        }


        // Save response to database
        const response = new Response({  responses: formData });
        await response.save();

        // External API 1: Send form data to external API
        const api1Url = process.env.API1_URL || 'http://127.0.0.1:8000/generate-mental-health-report';
        const api1Response = await axios.post(api1Url, formData);

        const api2Response = await axios.post("http://localhost:8000/generate-weekly-tasks", {
            user_id: api1Response.data.user_id
        });
        const report= api1Response.data.report;
        const tasks = api2Response.data.tasks;
        // Respond with success
        res.status(200).json({
            report,
             tasks,
        });
    } catch (error) {
        console.error('Error processing the request:', error.message);
        res.status(500).json({ error: error.message });
    }
};

// Endpoint to download the saved MD file
exports.downloadReport = (req, res) => {
    const reportPath = path.join(__dirname, '../reports/mental-health-report.md');
    res.download(reportPath, 'mental-health-report.md', (err) => {
        if (err) {
            console.error('Error sending the report file:', err.message);
            res.status(500).json({ error: 'Failed to download the report file' });
        }
    });
};