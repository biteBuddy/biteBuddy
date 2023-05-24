// const { foodData } = require('.././data');
// const newData = foodData.map((dish) => {
//   const {
//     name,
//     description,
//     img,
//     restaurantId,
//     mass_in_g,
//     calories,
//     protein,
//     carbs,
//     fat,
//     price,
//   } = dish;
//   return {
//     name,
//     description,
//     img,
//     restaurantId,
//     nutrient: {
//       mass_in_g,
//       calories,
//       protein,
//       carbs,
//       fat,
//       price,
//     },
//   };
//   r;
// });
// console.log(newData);


const otp = require('otp-generator');

console.log(otp.generate(7,{upperCaseAlphabets:false,lowerCaseAlphabets:false,specialChars:false}))
console.log(Date.now())
