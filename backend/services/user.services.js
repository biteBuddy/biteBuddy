const UserModel = require("../model/user.model");
const jwt= require("jsonwebtoken");
class UserServices{
    static async registerUser(email,password){
        try{
            const createUser= new UserModel({email,password}); //store data
            return await createUser.save(); //stores in database

        }catch(err){
            throw err;
        }
    }
    static async checkuser(email){
        try{
                return await UserModel.findOne({email});
        }catch(error){
            throw error;
        }
    }
    static async generateToken({tokenData,secretKey,jwt_expire}){
        return jwt.sign(tokenData,secretKey,{expiresIn:just_expire});
    }
}
module.exports= UserServices;