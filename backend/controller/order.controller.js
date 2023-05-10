const orderModel = require('../model/order.model');

const getOrders = async (req, res) => {
  const {
    user: { userId },
  } = req;
  const orders = await orderModel.find({ createdBy: userId });
  res.status(200).json({ success: true, data: orders });
};

const cancelOrder = async (req, res) => {
  const {
    user: { userId },
    body: { orderId },
  } = req;
  if (!orderId) {
    throw Error('Pleaes provide an orderId');
  }
  const deletedOrder = await orderModel.deleteOne({ _id: orderId });
  res.status(200).json({ success: true, deletedOrder });
};
module.exports = { getOrders, cancelOrder };
