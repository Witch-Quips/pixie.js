const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');

const mockUser = {
  username: 'Julius',
  email: 'orange@julius.com',
  password: 'jujuju',
};

describe('cards backend-express-template routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  const registerAndLogin = async (userProps = {}) => {
    const password = userProps.password ?? mockUser.password;
    const agent = request.agent(app);
    const [user] = await UserService.create({ ...mockUser, ...userProps });
  
    const { email } = user;
    await agent.post('/api/v1/users/sessions').send({ email, password });
    return [agent, user];
  };

  it('#POST should create a user_card table row', async () => {
    const [agent, user] = await registerAndLogin();
    const newRow = {
      user_id: user.id,
      card_id: 26,
    };

    const res = await agent
      .post(`/api/v1/users/${user.id}/cards`)
      .send(newRow);
    expect(res.status).toEqual(200);
    // console.log('hey res', res.body);
    expect(res.body).toEqual({
      message: 'User card created',
      userCard:
        {
          id: expect.any(String),
          user_id: expect.any(String),
          card_id: expect.any(String),
        }
    });

  });
});
afterAll(() => {
  pool.end();
});

