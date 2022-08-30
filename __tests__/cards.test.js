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
    // console.log('hey res', res.body);
    expect(res.status).toBe(200);
  });

  it(' #GET one should return a single card', async () => {
    const res = await request(app).get('/api/v1/cards/1');
    // console.log('hey res', res.body);
    expect(res.body).toEqual({
      id: expect.any(String),
      name: expect.any(String),
      position_id: expect.any(String),
      arcana: expect.any(String),
      suit_id: expect.any(String),
      image: expect.any(String),
    });
  });

  it('#UPDATE should update a card', async () => {
    const res = await request(app)
      .put('/api/v1/cards/1')
      .send({ name: 'updated card' });
    expect(res.body.name).toBe('updated card');
    expect(res.status).toBe(200);
  });

  
});
afterAll(() => {
  pool.end();
});

