const UserServices = require('../services/user.services');
const bcrypt = require('bcrypt');
const sendOtp = require('./mailer.controller');
const otpModel = require('../model/otp.model');
const otp = require('otp-generator');
const UserModel = require('../model/user.model');
require('dotenv').config();
//register
exports.register = async (req, res) => {
  const { email, password } = req.body;
  console.log(req.body);
  const sucessRes = await UserServices.registerUser(email, password);
  res.json({ status: true, success: 'User registered successfully' });
};
//login
exports.login = async (req, res) => {
  const { email, password } = req.body;
  const user = await UserServices.checkuser(email);
  if (!user) {
    throw Error("User doesn't exist");
  }
  if (!password) {
    throw Error('Please enter a password');
  }
  const isMatch = await user.comparePassword(password);

  if (isMatch === false) {
    throw new Error('Invalid Password!');
  }
  let tokenData = { userId: user._id, email: user.email };

  const token = await UserServices.generateToken(
    tokenData,
    process.env.JWT_SECRET,
    process.env.JWT_EXPIRES_IN
  );
  res.status(200).json({ status: true, token: token });
};

exports.forgotPassword = async (req, res) => {
  const { email } = req.body;

  const user = await UserModel.findOne({ email: email });

  if (!user) {
    throw Error('Cannot Find the user with the provided Email');
  }

  const generatedOtp = otp.generate(5, {
    upperCaseAlphabets: false,
    lowerCaseAlphabets: false,
    specialChars: false,
  });
  const otpExist = await otpModel.findOne({ userId: user.id });
  if (otpExist) {
    otpExist.otp = generatedOtp;
    await otpExist.save();
  } else {
    const newOtp = await otpModel.create({
      userId: user.id,
      otp: generatedOtp,
    });
  }

  sendOtp('bikrajshrestha2@gmail.com', 'Bikraj', generatedOtp);
  res.status(200).json({ success: true, msg: 'OTP was generated' });
};
exports.checkOtp = async (req, res) => {
  console.log('asdfsfasd');
  const { email, otp } = req.body;
  console.log(email, otp);
  const user = await UserModel.findOne({ email: email });
  const otpExist = await otpModel.findOne({ userId: user.id });

  if (otp == otpExist.otp) {
    res.status(200).json({ success: true, msg: 'Correct Otp' });
  } else {
    throw new Error('Otp Doesnot Match');
  }
};
exports.changePassword = async (req, res) => {
  const { email, newPassword } = req.body;
  console.log(email, newPassword);
  if (!newPassword) {
    res.status(400).json({ success: true, msg: 'Please Enter a new password' });
  }
  const user = await UserModel.findOne({ email: email });
  user.password = newPassword;
  const salt = await bcrypt.genSalt(10);
  const hashpass = await bcrypt.hash(user.password, salt);
  user.password = hashpass;
  await user.save();

  res.status(200).json({ success: true, msg: 'Password is changed' });
};
