//index.js starting point for node js application
const app= require("./app"); //importing the files in the folder
const db= require("./config/db");
const UserModel= require("./model/user.model");

//running the project and checking if it works
const port=3000;
app.get("/",(req,res)=>{
    res.send("Working yayy!!");
})
app.listen(port,()=>{
    console.log(`server is running on port http://localhost:${port}`);
})