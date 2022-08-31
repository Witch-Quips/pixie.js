const pool = require('../utils/pool');
const Card = require('../models/Card'); 

module.exports = class UserCard {
  id;
  user_id;
  card_id;

  constructor(row) {
    this.id = row.id;
    this.user_id = row.user_id;
    this.card_id = row.card_id;
  }
  
  static async insertCard(user_id, card_id) {
    const { rows } = await pool.query(
      `
        INSERT INTO user_cards (user_id, card_id)
        VALUES ($1, $2)
        RETURNING *
      `,
      [user_id, card_id]
    );
    return new UserCard(rows[0]);
  }

  static async getById(user_id) {
    const { rows } = await pool.query(
      `
      SELECT cards.id, cards.name, cards.position_id, cards.suit_id, cards.image
      FROM cards
      LEFT JOIN user_cards
      ON cards.id = user_cards.card_id
      WHERE user_cards.user_id = $1
    `, [user_id]
    ); return new Card(rows[0]);

  }



};
