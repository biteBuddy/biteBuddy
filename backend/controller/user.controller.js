const UserServices= require("../services/user.services");

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