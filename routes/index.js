const { resolveInclude } = require('ejs');
var express = require('express');
var router = express.Router();

/* GET home page. */
// Definir ruta root por defecto a /ia/start.
router.get('/', function(req, res, next) {

  res.redirect("/ia/start");
});

validateSession = function (req, res, next) {
  console.log("VALIDATE SESSION", req.session.usuario);
  
  if (req.session.usuario == undefined) {
    res.redirect("/ia/login");
    return;
  }

  res.locals.session = req.session;
  console.log("RES.LOCALS.SESSION", res.locals.session);
  next();
};


// localhost:3001/ia/start

router.use("/ia", require("./start/index"));
router.use("/ia", require("./login/index"));
router.use("/ia", validateSession, require("./eleccion/index"));
router.use("/panelDeControl", validateSession, require("./panelDeControl/index"));


module.exports = router;
