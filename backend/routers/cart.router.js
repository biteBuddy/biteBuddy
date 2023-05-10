const cartRouter = require('express').Router();
const {
  updateCart,
  getFromCart,
  checkOut,
} = require('../controller/cart.controller');
cartRouter.post('/', updateCart);
cartRouter.get('/', getFromCart);
cartRouter.post('/checkout', checkOut);
module.exports = cartRouter;
