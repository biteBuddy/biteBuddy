//mongodb schema model
const mongoose= require("mongoose");
const db= require("../config/db");

const {Schema}=mongoose; //importing schema property

//creating user schema
const userSchema= new Schema(
    {
        email:
        {
            type: String,
            lowercase: true,
            required:true,
            unique:true
        },
        password:{
            type:String,
            required:true,

        }
    }
);

const UserModel= db.model("user",userSchema);

module.exports=UserModel;