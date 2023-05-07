const mongoose = require('mongoose')
const {itemSchema} = reqiure('./cart.model.js')
const order = mongoose.Schema({
    createdBy:{
        type:mongoose.Types.ObjectId,
        required:[true,"Need a user to have its order Id"]
    },
    items:[itemSchema],
    total:{
        
    }
})

module.exports = mongoose.model('order',order)