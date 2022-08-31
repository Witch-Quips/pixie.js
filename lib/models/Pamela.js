const pool = require('../utils/pool');

module.exports = class Pamela {
  id;
  name;
  life_span;
  photo;
  bio;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.life_span = row.life_span;
    this.photo = row.photo;
    this.bio = row.bio;
  }
  static async getBio() {
    const { rows } = await pool.query(
      `
            SELECT * FROM pamela
        `
    );
    return rows.map((row) => new Pamela(row));
  }
};
