const cartRouter = require('express').Router();
const { updateCart, getFromCart } = require('../controller/cart.controller');
cartRouter.post('/', updateCart);
cartRouter.get('/', getFromCart);

module.exports = cartRouter;
