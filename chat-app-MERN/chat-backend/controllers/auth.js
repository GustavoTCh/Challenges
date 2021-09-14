const { response } = require('express');
const bcrypt = require('bcryptjs');

const User = require('../models/user');
const { generateJWT } = require('../helpers/jwt');
const createUser = async (req, res = response) => {
    try {
        const { email, password } = req.body;
        const existEmail = await User.findOne({ email });

        if (existEmail) {
            return res.status(400).json({
                ok: false,
                msg: 'The email exist',
            })
        }
        const user = new User(req.body);

        // Encrypt password
        const salt = bcrypt.genSaltSync();
        user.password = bcrypt.hashSync(password, salt);

        await user.save();

        // generate JWT
        const token = await generateJWT(user.id);

        res.json({
            ok: true,
            user
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Contacted admin'
        });
    }
}

const login = async (req, res = response) => {
    const { email, password } = req.body;
    try {
        const userDB = await User.findOne({ email });
        if (!userDB) {
            return res.status(404).json({
                ok: false,
                msg: 'Email or password is incorrect'
            });
        }

        const validPassword = bcrypt.compareSync(password, userDB.password);

        if (!validPassword) {
            return res.status(404).json({
                ok: false,
                msg: 'Email or password is incorrect'
            });
        }

        // generate JWT
        const token = await generateJWT(userDB.id);

        res.json({
            ok: true,
            user: userDB,
            token,
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Contacted admin'
        });
    }
}

const renew = async (req, res = response) => {
    const uid = req.uid;

    const token = await generateJWT(uid);

    const user = await User.findById(uid);

    res.json({
        ok: true,
        user,
        token
    });
}

module.exports = {
    createUSer: createUser,
    login,
    renew,
}