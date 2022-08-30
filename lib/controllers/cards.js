const { Router } = require('express');
// const UserService = require('../services/UserService');
const Card = require('../models/Card');

module.exports = Router().get('/', async (req, res, next) => {
  try {
    const cards = await Card.getAll();
    res.json(cards);
  } catch (e) {
    next(e);
  }
});
