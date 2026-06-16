const express = require('express');

const router = express.Router();

const {
  register
} = require('../controllers/authController');

router.post('/register', register);

module.exports = router;


const projectRoutes = require("./routes/projectRoutes");
const authRoutes = require("./routes/authRoutes");

...

app.use("/api/projects", projectRoutes);
app.use("/api/auth", authRoutes);
