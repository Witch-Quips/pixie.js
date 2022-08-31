const pool = require('../utils/pool');

module.exports = class Meaning {
  id;
  card_id;
  name;
  number;
  keyword_0;
  keyword_1;
  keyword_2;
  meaning_0;
  meaning_1;
  meaning_2;

  constructor(row) {
    this.id = row.id;
    this.card_id = row.card_id;
    this.name = row.name;
    this.number = row.number;
    this.keyword_0 = row.keyword_0;
    this.keyword_1 = row.keyword_1;
    this.keyword_2 = row.keyword_2;
    this.meaning_0 = row.meaning_0;
    this.meaning_1 = row.meaning_1;
    this.meaning_2 = row.meaning_2;
  }
  static async getAll() {
    const { rows } = await pool.query(
      `
                SELECT * FROM meaning
            `
    );
    return rows.map((row) => new Meaning(row));
  }
};
