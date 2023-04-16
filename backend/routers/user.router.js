const router = require('express').Router(); //importing router from express library
const UserController= require("../controller/user.controller");

router.post('/registration',UserController.register
);
router.post('/login',UserController.login
);
module.exports=router;
