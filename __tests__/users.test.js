const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

const mockUser = {
  email: 'greatoak@legendofzelda.com',
  password: 'password',
  username: 'greatoak',
};

describe('users backend-express-template routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  it('creates and signs in a new user', async () => {
    const res = await request(app).post('/api/v1/users/').send(mockUser);
    expect(res.status).toEqual(200);
    const { email, username } = mockUser;
    expect(res.body).toEqual({
      message: 'Sign in successful',
      user: {
        id: expect.any(String),
        email,
        username,
      },
    });
  });
  it('signs in existing user, and redirects to list of users', async () => {
    await request(app).post('/api/v1/users').send(mockUser);
    const res = await request(app)
      .post('/api/v1/users/sessions')
      .send({ email: 'greatoak@legendofzelda.com', password: 'password' });
    expect(res.status).toBe(200);
  });
});
