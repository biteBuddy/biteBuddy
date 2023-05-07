const { nutrientSchema } = require('./nutrient.model');
const { modelName } = require('./user.model');

const mongoose = require('mongoose');

const foodSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the food.'],
  },
  description: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the food.'],
  },
  img: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the food.'],
  },
  restaurantId: {
    type: mongoose.Types.ObjectId,
    ref: 'restaurant',
    required: [true, 'Food can only belong to a valid restaurant.'],
  },
  nutrient: {
    type: nutrientSchema,
    required: [true, 'Food must have some sort of nutrient value'],
  },
});

module.exports = mongoose.model('food', foodSchema);
