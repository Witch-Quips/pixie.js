const pool = require('../utils/pool');

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
};
