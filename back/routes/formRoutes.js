const express = require('express');
const router = express.Router();
const formController = require('../controllers/formController');

router.post('/submit-form', formController.submitForm);

// Route to download the AI report
router.get('/download-report', formController.downloadReport);

module.exports = router;
