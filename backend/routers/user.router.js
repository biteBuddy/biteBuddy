const router = require('express').Router(); //importing router from express library
const UserController = require('../controller/user.controller');

//registration api
router.post('/registration', UserController.register);
//login api
router.post('/login', UserController.login);
router.post('/forgotPassword', UserController.forgotPassword);
router.post('/checkOtp', UserController.checkOtp);
router.post('/changePassword', UserController.changePassword);
module.exports = router;
