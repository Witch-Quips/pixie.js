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

  it(' #GET all should return a list of authors', async () => {
    const res = await request(app).get('/api/v1/authors');
    expect(res.status).toBe(200);
  });














});
