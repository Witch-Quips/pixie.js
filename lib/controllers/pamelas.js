const { Router } = require('express');
const Pamela = require('../models/Pamela');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const cards = await Pamela.getBio();
      res.json(cards);
    } catch (e) {
      next(e);
    }
  });
