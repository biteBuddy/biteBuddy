//mongodb schema model
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const db = require('../config/db');

const { Schema } = mongoose; //importing schema property

//creating user schema
const userSchema = new Schema({
  email: {
    type: String,
    rquired: [true, 'Please provide a email. '],
    match: [
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
      'Please provide a valid email. ',
    ],
    unique: true,
    minlength: 8,
  },
  password: {
    type: String,
    rquired: [true, 'Please provide a name. '],
    minlength: 8,
  },
});
//password encryption
userSchema.pre('save', async function () {
  try {
    var user = this;
    const salt = await bcrypt.genSalt(10);
    const hashpass =  bcrypt.hash(user.password, salt);

    user.password = hashpass;
  } catch (error) {
    throw error;
  }
});

//compare password from the ones stored in mongoDB for the login purpose
userSchema.methods.comparePassword = async function (userPassword) {
  try {
    const isMatch = await bcrypt.compare(userPassword, this.password);
  } catch (error) {
    throw error;
  }
};

const UserModel = mongoose.model('userBiteBuddy', userSchema);

module.exports = UserModel;
