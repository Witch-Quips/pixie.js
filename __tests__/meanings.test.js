const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('Meanings backend-express-template routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });
  it('#GET should return a list of all card meanings', async () => {
    const res = await request(app).get('/api/v1/meanings');
    expect(res.status).toBe(200);
    console.log('hey resibod', res.body[0]);
    expect(res.body[0]).toEqual({
      id: expect.any(String),
      card_id: expect.any(Number),
      name: expect.any(String),
      number: expect.any(Number),
      keyword_0: expect.any(String),
      keyword_1: expect.any(String),
      keyword_2: expect.any(String),
      meaning_0: expect.any(String),
      meaning_1: expect.any(String),
      meaning_2: expect.any(String),
    });
  });
});
