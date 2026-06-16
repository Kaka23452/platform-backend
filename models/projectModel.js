const pool = require('../db');

async function getUserByEmail(email) {
  const result = await pool.query(
    'SELECT * FROM users WHERE email = $1',
    [email]
  );

  return result.rows[0];
}

async function createUser(
  email,
  username,
  passwordHash
) {
  const result = await pool.query(
    `INSERT INTO users
     (email, username, password_hash)
     VALUES ($1, $2, $3)
     RETURNING *`,
    [email, username, passwordHash]
  );

  return result.rows[0];
}

module.exports = {
  getUserByEmail,
  createUser
};
