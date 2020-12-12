var express = require('express');
const Models = require('../../models');
var router = express.Router();


router.get('/logout', function (req, res, next) {
  
  req.session.usuario = undefined;

  res.redirect("/ia/login");
  return;
});

// Cargar la vista login.ejs con las variables title y text.
router.get('/login', function (req, res, next) {

  res.locals.title = "Web Login";

  res.render('login/login');
});

router.post("/login", async function (req, res, next) {
  console.log("");
  console.log("POST LOGIN", req.body);

  let filter = { where: { estado: 1, usuario: req.body.usuario, password: req.body.password } };
  let usuarios = await Models.Usuario.findAll(filter);

  if (usuarios.length <= 0) {
    
    req.flash('error', 'Usuario o contraseña incorrectos');
    res.redirect("/ia/login");

    return;
  }

  req.session.usuario = usuarios[0];

  // Si el tipo de usuario es alumno
  if (req.session.usuario.tipoUsuario == "alumno") {
    res.redirect("/ia/eleccionJuego");
  }
  else {
    res.redirect("/panelDeControl/list");
  }
  
  return;
});

module.exports = router;