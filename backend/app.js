const express = require('express');
const app = express();
const http = require('http');
const dotenv = require("dotenv");
const cors = require("cors");
app.use(cors());
app.use(express.json());
const Product = require('../backend/data_models/Product_schema');


    //connecting mongodb with backend using app code
    dotenv.config({ path: "./config.env" });
    require('../backend/db/dbcnn');
// app.use(express.limit(100000000));


//connecting mongodb with backend using app code
// app.use(express.json());
//app.use(bodyParser.json({limit: '50mb'}));
//app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(express.json({limit:'50mb'}));

const server = http.createServer(app);
const port = "8000";


app.get("/",async (req, res) =>  {
    console.log("nybu");
    res.send("ok data");
})

app.get("/product_data", async (req, res) => {
    console.log("hello dear")
    const total_products = await Product.aggregate([
        {$unwind: '$products'},
        {$match: {'products.rating': { $gte: "0",$lte: "5"}}},]
        )
    res.json(total_products);
})

app.get("/get_order_product", async (req, res) => {
    
      //console.log(req.header("authorization")+"hiii");
      // console.log(req.header("size") + "hiii");
      let orderid = req.header("userobjectid");
    console.log("hello dear")
    await Product.findOne({ "userobjectid" : orderid }).then(async (userExist) => {
        console.log(userExist)
        if(userExist) {
            res.json(userExist);
        } else {
            res.send("No Product Found")
        }
    })
    
})

app.get("/product_data_type", async (req, res) => {
    console.log("hello dear");
     // console.log(req.header("size") + "hiii");
     let type = req.header("Type");
    const total_products = await Product.aggregate([
        {$unwind: '$products'},
        {$match: {'products.type': type}},]
        ).then( async (userExist2) => {
            if(userExist2) {
                res.json(userExist2);
            } else {
                res.send("No Product Found As This Type")
            }
        })
})





server.listen(port , "192.168.31.202" , () => {
    console.log("hello server started");
})