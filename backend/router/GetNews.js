const express = require('express');
const router = express.Router();
const app = express();
// const jwt = require("jsonwebtoken");
// const bcrypt = require('bcryptjs');
// const cloudinary = require("../db/cloudinaryconfig");
// const upload = require("./multer");
// const fs = require("fs");
// const path = require("path");
// const Razorpay = require('razorpay');
// const streamifier = require("streamifier");
// const multer = require("multer");
// const upload = multer();

app.use(express.json());

// require('../db/conn');
// require('./jwt_auth');
// const User = require('../model/userSchema');
// const Wallet = require("../model/UserWallet_Model");
// const Customer = require("../model/customers_model");
// const jwtauth = require('./jwt_auth');
const { json } = require('express');


router.post('/GetAllnews',  async (req, res ) => {

    

    //deleting the value from mongodb


    


    // if(!email || !password){
    //     return res.send.json({error: "plz type all field"});
    // };
    
});


module.exports = router;