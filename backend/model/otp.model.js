const mongoose = require('mongoose');

const userOtp = mongoose.Schema({
  userId: {
    type: mongoose.Types.ObjectId,
    ref: 'user',
    required: [true, 'Need an User for the otp'],
    unique:[true,"One user can have only one instance of an OTP"]
  },
  otp: {
    type: String,
    required: [true, 'Requires the otp'],
  },
  timeCreated: {
    type: Number,
    required: [true, 'Time created to Create Expiration'],
    default: Date.now(),
  },
});

module.exports = mongoose.model('otp', userOtp);
