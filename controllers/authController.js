const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
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
      user
    });

  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: 'Registration failed'
    });
  }
}

async function login(req, res) {
  try {
    const { email, password } = req.body;

    const user =
      await userModel.getUserByEmail(email);

    if (!user) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    const validPassword =
      await bcrypt.compare(
        password,
        user.password_hash
      );

    if (!validPassword) {
      return res.status(401).json({
        error: 'Invalid credentials'
      });
    }

    const token = jwt.sign(
      {
        id: user.id,
        email: user.email
      },
      'secret123',
      {
        expiresIn: '7d'
      }
    );

    res.json({
      token
    });

  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: 'Login failed'
    });
  }
}

module.exports = {
  register,
  login
};
