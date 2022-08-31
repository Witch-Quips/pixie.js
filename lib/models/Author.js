const pool = require('../utils/pool');

module.exports = class Author {
  id;
  name;
  github;
  linkedin;
  tarot_card;
  image;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.github = row.github;
    this.linkedin = row.linkedin;
    this.tarot_card = row.tarot_card;
    this.image = row.image;
  }
  static async getAllAuthors() {
    const { rows } = await pool.query(
      `
            SELECT * FROM authors
        `
    );
    return rows.map((row) => new Author(row));
  }
};
