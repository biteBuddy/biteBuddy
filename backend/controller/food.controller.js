const { foodData } = require('../data');
const Food = require('../model/food.model');
const { nutrientModel } = require('../model/nutrient.model');
const createFood = async (req, res) => {
  await foodData.forEach(async (food) => {
    const {
      nutrient: { mass_in_g, calories, protein, carbs, fat, price },
      ...rest
    } = food;

    const newFood = await Food.create({
      ...rest,
      nutrient: nutrientModel({
        mass_in_g: mass_in_g,
        calories: calories,
        protein: protein,
        carbs: carbs,
        fat: fat,
        price: price,
      }),
    });
    console.log(`New food created: ${newFood.name}`);
  });

  res.status(200).json({ success: true, msg: 'Added data to the database' });
};
const getFoodOfRestaurant = async (req, res) => {
  const { resId } = req.query;
  console.log(resId);
  const food = await Food.find({ restaurantId: resId });
  res.status(200).json({ success: true, data: food });
};
const getFoods = async (req, res) => {
  const foods = await Food.find();
  res.status(200).json({ sucess: true, data: foods });
};
const getSingleFood = async (req, res) => {
  const { id } = req.params;
  const food = await Food.findById(id);
  res.status(200).json({ success: true, data: food });
};
module.exports = {
  createFood,
  getFoodOfRestaurant,
  getFoods,
  getSingleFood,
};
