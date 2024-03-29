const mongoose = require('mongoose');
const { itemSchema } = require('./cart.model.js');
const {addressSchema} = require('./address.model.js')
const order = mongoose.Schema({
  createdBy: {
    type: mongoose.Types.ObjectId,
    required: [true, 'Need a user to have its order Id'],
  },
  items: [itemSchema],
  total: {
    type: Number,
    required: true,
    min: [0, 'Cannot create acart with total price of Zero.'],
  },
  deliveryAddress :{
    type:addressSchema,
    required:true,
  }
});

module.exports = mongoose.model('order', order);
