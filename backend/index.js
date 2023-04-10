const app= require("./app");

const port=3000;
app.get("/",(req,res)=>{
    res.send("Working yayy!!");
})
app.listen(port,()=>{
    console.log(`server is running on port http://localhost:${port}`);
})