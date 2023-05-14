const mongoose = require('mongoose');

const addressSchema = mongoose.Schema({
  belongsTo: {
    type: mongoose.Types.ObjectId,
    ref: 'biteBuddyUser',
    required: true,
  },
  fullName: {
    type: String,
    required: true,
  },
  State: {
    type: String,
    required: true,
  },
  Distric: {
    type: String,
    required: true,
  },
  City: {
    type: String,
    required: true,
  },
  PhoneNumber: {
    type: Number,
    required: true,
  },
  Address1: {
    type: String,
    required: true,
  },
  Address2: {
    type: String,
  },
  extraDetails: {
    type: String,
  },
});

module.exports = mongoose.model('address', addressSchema);
