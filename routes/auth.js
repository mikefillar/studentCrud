const express = require('express');
const router = express.Router();
const admin_controller = require('../controller/auth_account');

router.post('/login',admin_controller.loginAccount);
router.post('/addStudent',admin_controller.addStudent);
router.get('/update/:student_id', admin_controller.update);
router.get('/deleteStudent/:student_id', admin_controller.deleteStudent);
module.exports = router;