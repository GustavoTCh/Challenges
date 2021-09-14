const { Router } = require("express");
const { check } = require("express-validator");
const { createUser, login, renew } = require("../controllers/auth");
const { validateJWT } = require("../middlewares/validate-jwt");
const { validateParams } = require("../middlewares/validate-params");


const router = Router();

//  create new user
router.post('/new', [
    check('name', 'the name is required').notEmpty(),
    check('password', 'the password is required').notEmpty(),
    check('email', 'the email is required').isEmail(),
    validateParams
], createUser);

//  login
router.post('/', [
    check('email', 'the email is required').isEmail(),
    check('password', 'the password is required').notEmpty(),
    validateParams
], login);

//  login
router.get('/renew', validateJWT, renew);


module.exports = router;