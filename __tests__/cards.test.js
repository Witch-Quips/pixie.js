const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('cards backend-express-template routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it(' #GET all should return a list cards', async () => {
    const res = await request(app).get('/api/v1/cards');
    console.log('hey res', res.body);
    expect(res.status).toBe(200);
  });

  afterAll(() => {
    pool.end();
  });
});
