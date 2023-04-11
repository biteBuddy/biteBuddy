//makes use of express js to make use of routes and other things
const express= require("express"); //importing the package
const body_parser=require("body-parser");
const userRouter = require("./routers/user.router");

const app = express();// making use of variable app to import the module (like creating instance)
app.use(body_parser.json());

app.use("/",userRouter);

module.exports=app; //exporting the app
