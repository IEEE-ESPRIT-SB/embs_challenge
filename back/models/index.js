// models/index.js
const Sequelize = require('sequelize');
const sequelize = new Sequelize(process.env.MONGO_URI); // Replace with your actual database URL

const models = {
    User: require('./userModel')(sequelize, Sequelize.DataTypes),
    Report: require('./reportModel')(sequelize, Sequelize.DataTypes),
    // Add other models if needed
};

Object.keys(models).forEach((modelName) => {
    if (models[modelName].associate) {
        models[modelName].associate(models);
    }
});

models.sequelize = sequelize;
models.Sequelize = Sequelize;

module.exports = models;
