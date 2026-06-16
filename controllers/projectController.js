const projectModel = require('../models/projectModel');

async function getProjects(req, res) {
  try {
    const projects = await projectModel.getAllProjects();

    res.json(projects);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: 'Failed to fetch projects'
    });
  }
}

async function createProject(req, res) {
  try {
    const { name, description } = req.body;

    const project = await projectModel.createProject(
      name,
      description
    );

    res.status(201).json(project);

  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: 'Failed to create project'
    });
  }
}

module.exports = {
  getProjects,
  createProject
};
const axios = require("axios");

async function testN8n(req, res) {
  try {

    const response = await axios.post(
      "http://n8n:5678/webhook-test/test-flow",
      {
        source: "platform-backend"
      }
    );

    res.json({
      success: true,
      n8n: response.data
    });

  } catch (error) {

    console.error(error);

    res.status(500).json({
      success: false,
      error: error.message
    });

  }
}
