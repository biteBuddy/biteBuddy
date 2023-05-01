const { modelName } = require('./user.model');

const mongoose = require('mongoose');

const nutrientSchema = new mongoose.Schema({
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
});

module.exports = mongoose.model('nutrient', nutrientSchema);
