const { makePayment } = require('../controller/stripe.controller');

const paymentRouter = require('express').Router();

paymentRouter.post('/', makePayment);

module.exports = paymentRouter;
