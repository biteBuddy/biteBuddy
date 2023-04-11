const UserModel = require("../model/user.model")
class UserServices{
    static async registerUser(email,password){
        try{
            const createUser= new UserModel({email,password}); //store data
            return await createUser.save(); //stores in database

        }catch(err){
            throw err;
        }
    }
}
module.exports= UserServices;