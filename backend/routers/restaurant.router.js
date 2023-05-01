const restuarantRouter = require('express').Router(); //importing router from express library
const {
    createRestaurant,
    getRestaurants
} = require('../controller/restaurant.controller')


//registration api
restuarantRouter.post('/create', createRestaurant);
//login api
restuarantRouter.get('/get',getRestaurants);
module.exports = restuarantRouter;
