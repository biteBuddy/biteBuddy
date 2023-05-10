const mongoose = require('mongoose');
const itemSchema = mongoose.Schema({
  foodId: {
    type: mongoose.Types.ObjectId,
    requried: [true, 'Enter a valid foodId'],
    ref: 'food',
  },
  quantity: {
    type: Number,
    required: true,
    min: [1, 'Must have a minimum of 1 '],
  },
});
const cartSchema = mongoose.Schema(
  {
    createdBy: {
      type: mongoose.Types.ObjectId,
      requried: [true, 'You will need to be an user to create a cart.'],
      ref: 'userBiteBuddy',
      unique: true,
    },
    items: [itemSchema],
  },
  { timestamps: true }
);

const cartModel = mongoose.model('cart', cartSchema);
const itemModel = mongoose.model('item', itemSchema);
module.exports = { cartModel, itemModel, itemSchema };
