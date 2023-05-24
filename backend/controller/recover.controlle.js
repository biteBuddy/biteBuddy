
exports.forgotPassword = async (req, res) => {

  const generatedOtp = otp.generate(7, {
    upperCaseAlphabets: false,
    lowerCaseAlphabets: false,
    specialChars: false,
  });

  sendMail('bikrajshrestha2@gmail.com', 'Bikraj', generatedOtp);
  res.status(200).json({success:true,msg: "OTP was generated"})
};