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

  static async updateById(id, newAttrs) {
    const card = await Card.getById(id);
    if(!card) return null;
    const updatedData = { ...card, ...newAttrs };
    const { rows } = await pool.query(
      `
      UPDATE cards 
      SET name = $2, position_id = $3, arcana = $4, suit_id = $5, image = $6
      WHERE id = $1
      RETURNING *
      `,
      [id, updatedData.name, updatedData.position_id, updatedData.arcana, updatedData.suit_id, updatedData.image]
    );
    return new Card(rows[0]);
  }

  static async getBySuitId(suit_id) {
    const { rows } = await pool.query(
      `
          SELECT * FROM cards
          WHERE suit_id = $1
      `, [suit_id]
    );
    return rows.map((row) => new Card(row));
  }


  static async getByPositionId(position_id) {
    const { rows } = await pool.query(
      `
          SELECT * FROM cards
          WHERE position_id = $1
      `, [position_id]
    );
    return rows.map((row) => new Card(row));
  }
};
