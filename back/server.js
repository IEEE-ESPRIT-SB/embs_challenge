const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const bodyParser = require('body-parser');
const formRoutes = require('./routes/formRoutes');
const fs = require('fs');
const path = require('path');

const authRoutes = require('./routes/auth.js');
const profileRoutes =require ('./routes/profile.js');
dotenv.config();
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;
app.use(cors());

// Middleware
app.use(bodyParser.json());

// Ensure the reports directory exists
const reportsDir = path.join(__dirname, 'reports');
if (!fs.existsSync(reportsDir)) {
    fs.mkdirSync(reportsDir);
}

// Connect to MongoDB
mongoose
    .connect(process.env.MONGO_URI, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    })
    .then(() => console.log('Connected to MongoDB'))
    .catch((error) => console.error('MongoDB connection error:', error));

// Routes
app.use('/api/form', formRoutes);
app.use('/api', authRoutes);
app.use('/profile', profileRoutes);
// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
