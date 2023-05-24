const mongoose = require('mongoose');
const nutrientSchema = require('./nutrient.model');
const restaurantSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the Restaurant.'],
  },
  description: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the Restaurant.'],
  },
  img: {
    type: String,
    required: [true, 'Please make Sure to enter a name for the Restaurant.'],
  },
  category: {
    type: String,
    enum: ['Fast Food', 'Fine Dining', 'Cafe', 'Buffet', 'Buffet'],
    required: [true, 'Restaurants must have a category.'],
  },
});
module.exports = mongoose.model('restaurant', restaurantSchema);
