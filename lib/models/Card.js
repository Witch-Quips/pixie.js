const pool = require('../utils/pool');

module.exports = class Card {
  id;
  name;
  position_id;
  arcana;
  suit_id;
  image;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.position_id = row.position_id;
    this.arcana = row.arcana;
    this.suit_id = row.suit_id;
    this.image = row.image;
  }
  static async getAll() {
    const { rows } = await pool.query(
      `
            SELECT * FROM cards
        `
    );
    return rows.map((row) => new Card(row));
  }
  static async getById(id) {
    const { rows } = await pool.query(
      `
            SELECT * FROM cards WHERE id = $1
        `,
      [id]
    );
    return new Card(rows[0]);
  }
};
