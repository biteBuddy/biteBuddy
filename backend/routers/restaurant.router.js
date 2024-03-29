const restuarantRouter = require('express').Router(); //importing router from express library
const {
  createRestaurant,
  getRestaurants,
  getRestaurant,
  searchRestaurant,
} = require('../controller/restaurant.controller');

//registration api
restuarantRouter.post('/', createRestaurant);
//login api
restuarantRouter.get('/', getRestaurants);
restuarantRouter.get('/search', searchRestaurant);
restuarantRouter.get('/:id', getRestaurant);
module.exports = restuarantRouter;
