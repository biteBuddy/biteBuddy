const { addressModel } = require('../model/address.model');
const addAddress = async (req, res) => {
  const {
    user: { userId },
    body: {
      fullName,
      State,
      Distric,
      City,
      PhoneNumber,
      Address1,
      Address2,
      extradetails,
    },
  } = req;
  console.log(req.body);
  const address = await addressModel.create({
    belongsTo: userId,
    fullName: fullName,
    State: State,
    Distric: Distric,
    City: City,
    PhoneNumber: PhoneNumber,
    Address1: Address1,
    Address2: Address2,
    extraDetails: extradetails,
  });
  res.status(200).json({ success: true, msg: 'Address Added', data: address });
};
const getAddress = async (req, res) => {
  const {
    user: { userId },
  } = req;
  const address = await addressModel.findOne({ belongsTo: userId });
  if (!address) {
    res
      .status(200)
      .json({ success: false, msg: 'The address for the user doesnot exist.' });
  }
  res.status(200).json({ success: true, data: address });
};
module.exports = {
  addAddress,
  getAddress,
};
