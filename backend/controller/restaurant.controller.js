const restaurant = require('../model/restaurant.model');
const data = require('../data.js');
const createRestaurant = async (req, res) => {
  await restaurant.create(data);
  res.status(200).json({ success: true, msg: 'Data Added' });
};

const getRestaurants = async (req, res) => {
  const restautants = await restaurant.find({}).select({"_id":1});
  res.status(200).json({ success: true, data: restautants });
};
module.exports ={
    createRestaurant,
    getRestaurants
}
