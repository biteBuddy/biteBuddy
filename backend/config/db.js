const mongoose = require('mongoose');
require('dotenv').config()
// const connection = mongoose.createConnection("mongodb://0.0.0.0:27017/userAuthentication").on("open",()=>{
//     console.log("MongoDb connected");
// }).on("error",()=>{
//     console.log("MongoDb connection error!!")
// });

const dbConnect = async () => {
  try {
    await mongoose.connect(
      process.env.MONGO_URI
    );
    console.log('Connected to the Database! ');
  } catch (error) {
    throw error;
  }
};

module.exports = dbConnect;
