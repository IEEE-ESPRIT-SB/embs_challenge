const mongoose = require('mongoose');

const taskSchema = new mongoose.Schema({
  user_id: { type: String, required: true },
  tasks: [
    {
      taskName: { type: String, required: true },
      description: { type: String },
      dueDate: { type: Date },
      status: { type: String, enum: ['pending', 'in-progress', 'completed'], default: 'pending' },
    }
  ],
  createdAt: { type: Date, default: Date.now }
});


const Task = mongoose.model('Task', taskSchema);

module.exports = Task;
