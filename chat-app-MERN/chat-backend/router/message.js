const { Router } = require("express");
const { getAllMessage } = require("../controllers/message");
const { validateJWT } = require("../middlewares/validate-jwt");

const router = Router();

router.get('/:from', validateJWT, getAllMessage);

module.exports = router;