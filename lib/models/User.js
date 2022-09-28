
const pool = require('../utils/pool');

module.exports = class User {
  id;
  email;
  #passwordHash;
  username;

  constructor(row) {
    this.id = row.id;
    this.email = row.email;
    this.#passwordHash = row.password_hash;
    this.username = row.username;
  }

  static async insert({ email, passwordHash, username }) {
    const { rows } = await pool.query(
      `INSERT INTO users (email, password_hash, username)
            VALUES($1, $2, $3)
            RETURNING *`,
      [email, passwordHash, username]
    );
    return new User(rows[0]);
  }
  
  static async getByEmail(email) {
    const { rows } = await pool.query(
      `
      SELECT * from users
      WHERE email = $1
      `, [email]
    ); if (!rows[0]) return null;
    return new User(rows[0]);
  }

  get passwordHash() {
    return this.#passwordHash;
  }

};
