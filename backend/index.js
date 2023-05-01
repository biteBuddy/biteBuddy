//makes use of express js to make use of routes and other things
require('express-async-errors');
const express = require('express'); //importing the package
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const restaurantRouter = require('./routers/restaurant.router');
const errorHandlerMiddleware = require('./middleware/error-handler');
const notFoundMiddleware = require('./middleware/not-found');
const app = express(); // making use of variable app to import the module (like creating instance//importing the files in the folder
const db = require('./config/db');
const UserModel = require('./model/user.model');

//running the project and checking if it works
const port = 3000;

app.use(body_parser.urlencoded({ extended: false }));
app.use(body_parser.json());
app.use(express.json());
app.use('/api/v1/user', userRouter);
app.use ('/api/v1/restaurant',restaurantRouter)
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
