const mongoose = require('mongoose');

const reportSchema = new mongoose.Schema({
    userid: { type: String, required: true }, // User ID received from AI or external API
    tasks: [
        {
            task_title: { type: String, required: true }, // Task title should be required
            task_description: { type: String, required: true }, // Task description should be required
            task_goal: { type: String, required: true }, // Task goal should be required
            task_complexity: { type: String, required: true }, // Task complexity should be required
            task_reveal_at: { type: String, required: true }, // Task reveal time should be required
            task_start_at: { type: String, required: true }, // Task start time should be required
            task_deadline_at: { type: String, required: true }, // Task deadline should be required
            task_late_submission_maximum_at: { type: String, required: true }, // Late submission deadline should be required
            indoor_or_outdoor: { type: String, required: true } // Indoor or outdoor activity should be required
        }
    ]
});

const Report = mongoose.model('Report', reportSchema);

module.exports = Report;
