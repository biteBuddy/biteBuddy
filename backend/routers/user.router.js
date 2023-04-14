const router = require('express').Router(); //importing router from express library
const UserController= require("../controller/user.controller");

router.post('/registration',UserController.register
);
module.exports=router;
