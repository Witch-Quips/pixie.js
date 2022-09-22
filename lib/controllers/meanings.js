const { Router } = require('express');
const Meaning = require('../models/Meaning');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const meanings = await Meaning.getAll();
      res.json(meanings);
    } catch (e) {
      next(e);
    }
  })

  .get('/:id', async (req, res, next) => {
    try {
      const meaning = await Meaning.getById(req.params.id);
      res.json(meaning);
    } catch (e) {
      next(e);
    }
  });
