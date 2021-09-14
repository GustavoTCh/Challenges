const jwt = require('jsonwebtoken');

const validateJWT = (req, res, next) => {
    try {
        const token = req.headr('x-token');

        if (!token) {
            return res.status(401).json({
                ok: false,
                msg: 'Token not found',
            });
        }
        const payload = jwt.verify(token, process.env.JWT_KEY);
        req.uid = payload.uid;

        next();
    } catch (error) {
        return res.status(401).json({
            ok: false,
            msg: 'Token not validated'
        });
    }
}

module.exports = {
    validateJWT
}