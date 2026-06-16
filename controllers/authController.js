const bcrypt = require('bcryptjs');
const userModel = require('../models/userModel');

async function register(req, res) {
  try {
    const { email, username, password } = req.body;

    const existingUser =
      await userModel.getUserByEmail(email);

    if (existingUser) {
      return res.status(400).json({
        error: 'Email already exists'
      });
    }

    const passwordHash =
      await bcrypt.hash(password, 10);

    const user = await userModel.createUser(
      email,
      username,
      passwordHash
    );

    res.status(201).json({
      message: 'User created',
      user: {
        id: user.id,
        email: user.email,
        username: user.username
      }
    });

  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: 'Registration failed'
    });
  }
}

module.exports = {
  register
};
