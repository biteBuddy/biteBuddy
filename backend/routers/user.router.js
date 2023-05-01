const router = require('express').Router(); //importing router from express library
const UserController = require('../controller/user.controller');

//registration api
router.post('/registration', UserController.register);
//login api
router.post('/login', UserController.login);
module.exports = router;
