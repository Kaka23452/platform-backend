const express = require('express');

const router = express.Router();

const auth = require('../middleware/authMiddleware');

const {
  getProjects,
  createProject
} = require('../controllers/projectController');

router.get('/', auth, getProjects);
router.post('/', auth, createProject);

module.exports = router;
