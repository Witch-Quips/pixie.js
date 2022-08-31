const { Router } = require('express');
// const UserService = require('../services/UserService');
const Author = require('../models/Author');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const cards = await Author.getAllAuthors();
      res.json(cards);
    } catch (e) {
      next(e);
    }
  });

