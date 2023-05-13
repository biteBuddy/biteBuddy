const addrressRouter = require('express').Router();
const { addAddress, getAddress } = require('../controller/address.controller');
addrressRouter.post('/', addAddress);
addrressRouter.get('/', getAddress);

module.exports = addrressRouter;
