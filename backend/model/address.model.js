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
    type: String,
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

const addressModel = mongoose.model('address', addressSchema);
module.exports = { addressSchema, addressModel };
