const UserServices = require('../services/user.services');
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
    throw new Error("User doesn't exist");
  }
  const isMatch = await user.comparePassword(password);
  if (isMatch === false) {
    throw new Error('Invalid Password!');
  }
  let tokenData = { _id: user._id, email: user.email };

  const token = await UserServices.generateToken(
    tokenData,
    process.env.JWT_SECRET,
    process.env.JWT_EXPIRES_IN
  );
  res.status(200).json({ status: true, token: token });
};
