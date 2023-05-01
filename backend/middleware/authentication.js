const jwt  = require('jsonwebtoken')
const {UnauthenticatedError} = require('../errors/index')
require('dotenv').config()
const authMiddleWare = async (req,res,next)=>{
    const authHeader = req.headers.authorization
    if(!authHeader || !authHeader.startsWith('Bearer ')){

        throw new UnauthenticatedError("No token sent")
    }
    const token = authHeader.split(' ')[1]
    try {
        
        const decoded = await jwt.verify(token,process.env.JWT_SECRET)
        req.user = {userId:decoded.userId,name:decoded.name,}
        next()
    } catch (error) {
        throw new UnauthenticatedError(error)
    }
}

module.exports = authMiddleWare