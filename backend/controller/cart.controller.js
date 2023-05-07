const { cartModel, itemModel } = require('../model/cart.model');
const foodModel = require('../model/food.model');
const getFromCart = async (req, res) => {
  const {
    user: { userId },
  } = req;
  const userCart = await cartModel.findOne({ createdBy: userId });
  if (!userCart) {
    const userCart = await cartModel.create({ createdBy: userId });
    res
      .status(200)
      .json({ success: true, data: userCart, msg: 'Created A new Cart' });
  }
  res.status(200).json({ success: true, data: userCart });
};
const updateCart = async (req, res) => {
  const {
    user: { userId },
    body: { itemId, quantity, foodId },
  } = req;
  //check to see if cart already exists for the user.
  var userCart = await cartModel.findOne({ createdBy: userId });
  if (!userCart) {
    userCart = await cartModel.create({ createdBy: userId });
  }
  //logic to check if the item already exists in the
  var itemsArray = userCart.items;
  const itemIndex = itemsArray.findIndex((item) => item._id == itemId);
  //if exists simply update the quantity
  if (itemIndex > -1) {
    var item = await itemModel.findOne({ _id: itemId });
    console.log(item);
    item.quantity = quantity;
    item.save();
    userCart.items[itemIndex] = item;
    userCart.save();
  } // else find if the foodId provided exists and create a new item with the foodId
  else {
    const food = await foodModel.findById(foodId);
    if (!food) {
      throw Error('Food with the given Id doesnot exist.');
    }
    const item = await itemModel.create({ foodId: foodId, quantity: quantity });
    userCart.items.push(item);
    userCart.save();
  }
  res.status(200).json({ success: true, cart: userCart });
};
const checkOut = async( req,res)=>{
    
}

module.exports = { updateCart,getFromCart };
