//makes use of express js to make use of routes and other things
require('express-async-errors');
const express = require('express'); //importing the package
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const restaurantRouter = require('./routers/restaurant.router');
const foodRouter = require('./routers/food.router');
const errorHandlerMiddleware = require('./middleware/error-handler');
const cartRotuer = require('./routers/cart.router');
const orderRouter = require('./routers/order.router');
const paymentRouter = require('./routers/stripe.router');
const notFoundMiddleware = require('./middleware/not-found');
const authMiddleWare = require('./middleware/authentication');
const app = express(); // making use of variable app to import the module (like creating instance//importing the files in the folder
const db = require('./config/db');
const UserModel = require('./model/user.model');
const addrressRouter = require('./routers/address.router');

//running the project and checking if it works
const port = 3000;

app.use(body_parser.urlencoded({ extended: false }));
app.use(body_parser.json());
app.use(express.json());
app.use('/api/v1/user', userRouter);
app.use('/api/v1/restaurant', restaurantRouter);
app.use('/api/v1/food', foodRouter);
app.use('/api/v1/cart', authMiddleWare, cartRotuer);
app.use('/api/v1/address',authMiddleWare,addrressRouter)
app.use('/api/v1/order', authMiddleWare, orderRouter);
app.use('/api/v1/payment', authMiddleWare, paymentRouter);
//middleware to catch error
app.use(errorHandlerMiddleware);
app.use(notFoundMiddleware);
runServer = async () => {
  try {
    await db();
    app.listen(port, () => console.log(`Server is listening on port ${port}`));
  } catch (error) {}
};

runServer();
