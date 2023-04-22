const UserModel = require("../model/user.model");
const UserServices= require("../services/user.services");
//register
exports.register= async (req, res, next)=>{
    try{
        const {email,password}= req.body;
        const sucessRes= await UserServices.registerUser(email,password);

        res.json({status:true,success:"User registered successfully"});
    }catch(error){
        console.log("-->error!!")
        throw error;
    }
}
//login
    exports.login= async (req, res, next)=>{
        try{
            const {email,password}= req.body;
            const user= await UserServices.checkuser(email);
            if(!user){
                throw new Error("user doesn't exist");
            }
            const isMatch= await user.comparePassword(password);
            if(isMatch===false){
                throw new Error("Invalid Password!");
            }
            let tokenData= {_id:user._id, email:user.email};
            const token= await UserServices.generateToken(tokenData,"secretKey","1h");
            res.status(200).json({status:true,token:token});
        
        }catch(error){
            console.log("-->error!!")
            throw error;
        }
}