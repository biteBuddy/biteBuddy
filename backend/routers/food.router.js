const foodRouter = require('express').Router(); //importing router from express library
const {
  createFood,
  getFoodOfRestaurant,
  getFoods,
  getSingleFood,
} = require('../controller/food.controller');

//registration api
foodRouter.post('/', createFood);
foodRouter.get('/restaurant/', getFoodOfRestaurant);
foodRouter.get('/', getFoods);
foodRouter.get('/:id', getSingleFood);
module.exports = foodRouter;
