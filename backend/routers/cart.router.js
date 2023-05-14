const cartRouter = require('express').Router();
const {
  updateCart,
  getFromCart,
  checkOut,
  removeFromCart,
} = require('../controller/cart.controller');
cartRouter.post('/', updateCart);
cartRouter.get('/', getFromCart);
cartRouter.post('/checkout', checkOut);
cartRouter.post('/delete', removeFromCart);
module.exports = cartRouter;
