const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('authors route', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  it(' #GET all should return a list of pamelas info', async () => {
    const res = await request(app).get('/api/v1/pamelas');
    expect(res.status).toBe(200);
  });
});
