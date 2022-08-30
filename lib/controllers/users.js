const { Router } = require('express');
const UserService = require('../services/UserService');
const ONE_DAY = 1000 * 60 * 60 * 24;

module.exports = Router()
  .post('/', async (req, res, next) => {
    try {
      const [user, token] = await UserService.create(req.body);
      
      res.cookie(process.env.COOKIE_NAME, token, {
        httpOnly: true,
        maxAge: ONE_DAY,
      })
        .json({ user, message: 'Sign in successful' });
    } catch (e) {
      next (e);
    }
  })
  .post('/sessions', async (req, res, next) => {
    try {
      const { email, password } = req.body;

      const token = await UserService.signIn({ email, password });
      res.cookie(process.env.COOKIE_NAME, token, {
        httpOnly: true,
        maxAge: ONE_DAY,
      })
        .json({ message: 'Welcome Back' });
    } catch (e) {
      next (e);
    }
  });
