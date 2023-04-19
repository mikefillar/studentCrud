const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    res.render('index');
});

router.get('/viewStudents',(req,res)=>{
    res.render('viewStudents');
});

module.exports = router;