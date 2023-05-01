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
  restaurntId: {
    type: mongoose.Types.ObjectId,
    ref: 'restaurant',
    required: [true, 'Food can only belong to a valid restaurant.'],
  },
  mass_in_g: {
    type: Decimal128,
    required: [true, 'Please make Sure to enter a mass_in_g for the nutrient.'],
  },
  calories: {
    type: Decimal128,
    required: [true, 'Please make Sure to enter a calories for the nutrient.'],
  },
  protein: {
    type: Decimal128,
    required: [true, 'Please make Sure to enter a protien for the nutrient.'],
  },
  carbs: {
    type: Decimal128,
    required: [true, 'Please make Sure to enter a carbs for the nutrient.'],
  },
  fat: {
    type: Decimal128,
    required: [true, 'Please make Sure to enter a fat for the nutrient.'],
  },
  price: {
    type: Decimal128,
    required: [true, 'Price must be entered.'],
  },
});

module.exports = mongoose.model('food', foodSchema);
