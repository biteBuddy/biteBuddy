const { modelName } = require('./user.model');

const mongoose = require('mongoose');

const nutrientSchema = new mongoose.Schema({
  mass_in_g: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Please make Sure to enter a mass_in_g for the nutrient.'],
  },
  calories: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Please make Sure to enter a calories for the nutrient.'],
  },
  protein: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Please make Sure to enter a protien for the nutrient.'],
  },
  carbs: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Please make Sure to enter a carbs for the nutrient.'],
  },
  fat: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Please make Sure to enter a fat for the nutrient.'],
  },
  price: {
    type: mongoose.Types.Decimal128,
    required: [true, 'Price must be entered.'],
  },
});

const nutrientModel = mongoose.model('nutrient', nutrientSchema);

module.exports = { nutrientSchema, nutrientModel };
