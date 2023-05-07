const restaurant = require('../model/restaurant.model');
const { resdData } = require('../data.js');
const createRestaurant = async (req, res) => {
  await restaurant.create(data);
  res.status(200).json({ success: true, msg: 'Data Added' });
};

const getRestaurants = async (req, res) => {
  const restautants = await restaurant.find({});
  res.status(200).json({ success: true, data: restautants });
};

const getRestaurant = async (req, res) => {
  // get restaurant info according to the id
  const { id } = req.params;
  const singleRestaurant = await restaurant.findById(id);
  res.status(200).json({ success: true, data: singleRestaurant });
};
module.exports = {
  createRestaurant,
  getRestaurants,
  getRestaurant,
};
