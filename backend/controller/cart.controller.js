const { addressModel } = require('../model/address.model');
const { cartModel, itemModel } = require('../model/cart.model');
const foodModel = require('../model/food.model');
const orderModel = require('../model/order.model');
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
  var itemsArray = userCart.items; // get items in the array of the user
  const itemIndex = itemsArray.findIndex((item) => item._id == itemId);
  var item;
  //if exists simply update the quantity
  if (itemIndex > -1) {
    item = await itemModel.findOne({ _id: itemId });
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
    item = await itemModel.create({ foodId: foodId, quantity: quantity });
    userCart.items.push(item);
    userCart.save();
  }
  res.status(200).json({ success: true, item: item });
};
const checkOut = async (req, res) => {
  //Logic to Transfer all the items of the user into order after user checkouts the cart
  try {
    const {
      user: { userId },
      body: {
        total,
        adress: {
          fullName,
          State,
          Distric,
          City,
          PhoneNumber,
          Address1,
          Address2,
          extradetails,
        },
      },
    } = req;
    const address = addressModel({
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
    console.log(address);
    const cart = await cartModel.findOne({ createdBy: userId });
    if (!cart) {
      throw Error('No cart with the users at this time.');
    }
    const items = cart.items;
    //Need to transfer the items to the order of thse user
    if (items.length == 0) {
      throw Error('Cannot checkout an order with no items in it.');
    }
    const _address = await addressModel.create();
    //checkout logic also works
    const newOrder = await orderModel.create({
      createdBy: userId,
      total: total,
      items: items,
      deliveryAddress: address,
    });
    cart.items = [];
    cart.save();
    res.status(200).json({
      success: true,
      msg: 'The order has been checkouted.',
      oder: newOrder,
    });
  } catch (error) {
    console.log(error);
  }
};
const removeFromCart = async (req, res) => {
  const {
    user: { userId },
    body: { itemId },
  } = req;
  const item = await itemModel.findById(itemId);
  const cart = await cartModel.findOne({ createdBy: userId });
  var itemsArray = cart.items; // get items in the array of the user
  const itemIndex = itemsArray.findIndex((item) => item._id == itemId);
  itemsArray.splice(itemIndex, 1);
  cart.items = itemsArray;
  cart.save();

  const deletedItem = await itemModel.deleteOne({ _id: itemId });
  return res.status(200).json({ success: true, msg: 'Item is Deleted' });
};
module.exports = { updateCart, getFromCart, checkOut, removeFromCart };
