const pool = require('../db');

async function getAllProjects() {
  const result = await pool.query(
    'SELECT * FROM projects ORDER BY id DESC'
  );

  return result.rows;
}

async function createProject(name, description) {
  const result = await pool.query(
    'INSERT INTO projects(name, description) VALUES($1, $2) RETURNING *',
    [name, description]
  );

  return result.rows[0];
}

module.exports = {
  getAllProjects,
  createProject
};
