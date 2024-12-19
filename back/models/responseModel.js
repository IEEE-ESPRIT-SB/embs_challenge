const mongoose = require('mongoose');

const responseSchema = new mongoose.Schema(
    {
        userId: { type: String, required: false }, // Placeholder for user tracking
        responses: { type: Object, required: true }, // Stores all form responses
        createdAt: { type: Date, default: Date.now },
    },
    { collection: 'formResponses' } // Optional: Specify collection name
);

module.exports = mongoose.model('Response', responseSchema);
