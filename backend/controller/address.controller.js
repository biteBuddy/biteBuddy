const Address = require('../model/address.model');
const addAddress = async (req, res) => {
  const {
    user: { userId },
    body: {
      fullname,
      state,
      district,
      city,
      number,
      address1,
      address2,
      extradetails,
    },
  } = req;

  const address = Address.create({
    belongsTo: userId,
    fullName: fullname,
    State: state,
    Distric: district,
    City: city,
    PhoneNumber: number,
    Address1: address1,
    Address2: address2,
    extraDetails: extradetails,
  });
  res.status(200).json({ success: true, msg: 'Address Added' });
};
const getAddress = async (req, res) => {};
module.exports = {
  addAddress,
  getAddress,
};
