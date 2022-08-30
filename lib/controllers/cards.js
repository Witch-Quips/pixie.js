const { Router } = require('express');
// const UserService = require('../services/UserService');
const Card = require('../models/Card');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const cards = await Card.getAll();
      res.json(cards);
    } catch (e) {
      next(e);
    }
  })
  .get('/:id', async (req, res, next) => {
    try {
      const card = await Card.getById(req.params.id);
      res.json(card);
    } catch (e) {
      next(e);
    }
  })
  .put('/:id', async (req, res, next) => {
    try {
      const card = await Card.updateById(req.params.id, req.body);
      res.json(card);
    } catch (e) {
      next(e);
    }
  });
  
