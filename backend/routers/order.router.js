const { getOrders, cancelOrder } = require('../controller/order.controller');

const orderRouter = require('express').Router();

orderRouter.get('/', getOrders);
orderRouter.delete('/', cancelOrder);
module.exports = orderRouter;
