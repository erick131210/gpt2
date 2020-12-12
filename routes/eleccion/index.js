const { resolveInclude } = require('ejs');
var express = require('express');
var app = require('../../app');
const Models = require('../../models');
//require('../../gpt2-generador');
var router = express.Router();


// Cargar la vista seleccionJugador.ejs con las variables title.
router.get('/eleccionJuego', function (req, res, next) {

  res.locals.title = "IA";
  res.locals.content = "eleccion/eleccionJuego";

  /***
   * ESTRUCTURA DE BD
   * FORMULARIO GENERAR TEXTO
   * CAMPO OCULTO MD5 DE LA FUNCIÓN TIME(STRING DE HORA) ()INPUT OCULTO
   * GENERA MD5 DIFERENTE PARA CADA EJECUCIÓN USADO PARA LA URL
   * ID, TEXTO(TIPO TEXT), TEXTOCOMANDO
   * RECIBO RESULTADO, ME GENERA EL REGISTRO
   * LLAMO AL TEXTORESULTADO DE LA BD EN UNA VISTA NUEVA Y PRUEBO
   */

  res.render('page');
});


router.get('/eleccionModo', function (req, res, next) {

  res.locals.title = "IA";
  res.locals.content = "eleccion/eleccionModo";


  res.render('page');
});


router.get('/eleccionEscenario', async function (req, res, next) {

  res.locals.title = "IA";
  res.locals.content = "eleccion/eleccionEscenario";

  let filter = { where: { estado: 1 }, attributes: ["idEscenario", "nombreEscenario"] };
  res.locals.escenarios = await Models.Escenario.findAll(filter);

  res.render('page');
});


router.get('/eleccionPersonaje/:nombreEscenario', async function (req, res, next) {

  res.locals.title = "IA";
  res.locals.content = "eleccion/eleccionPersonaje";

  let filter = { where: { estado: 1 }, attributes: ["idPersonaje", "nombrePersonaje"] };
  res.locals.personajes = await Models.Personaje.findAll(filter);

  res.locals.escenario = req.params.nombreEscenario;

  res.render('page');
});


router.get('/eleccionNombre/:nombreEscenario/:nombrePersonaje', function (req, res, next) {

  res.locals.title = "IA";
  res.locals.content = "eleccion/eleccionNombre";

  res.locals.nombreEscenario = req.params.nombreEscenario;
  res.locals.nombrePersonaje = req.params.nombrePersonaje;

  res.locals.obj = Models.TextoIA.build();

  

  res.render('page');
});


router.post('/generadorIA/:nombreEscenario/:nombrePersonaje', async function (req, res, next) {

  let parrafo1 = await execShellCommand('cd gpt-2-Pytorch && python3 main.py --text "You are a ' + req.params.nombreEscenario + " " + req.params.nombrePersonaje + '"');

  parrafo1 = "You are " + req.body.nombreUsuario + parrafo1;
  console.log("PÁRRAFO 1:", parrafo1);


  let parrafo2 = await execShellCommand('cd gpt-2-Pytorch && python3 main.py --text "You are a ' + req.params.nombreEscenario + " " + req.params.nombrePersonaje + ' and you choose to run."');
  console.log("");
  console.log("PÁRRAFO 2:", parrafo2);

  console.log("");
  console.log(req.body.idTextoIA);


  let filter = { where: { idTextoIA: req.body.idTextoIA } };
  const [t, created] = await Models.TextoIA.findOrCreate(filter);

  //t.idUsuario = req.session.idUsuario;  //req.session.idUsuario
  t.nombreEscenario = req.params.nombreEscenario;
  t.nombrePersonaje = req.params.nombrePersonaje;
  t.nombreUsuario = req.body.nombreUsuario;
  t.parrafo1 = parrafo1;
  t.parrafo2 = parrafo2;

  if (created) { 
    t.estado = 1;
  }

  await t.save();


  console.log(t.idTextoIA);
  
  let idTextoIA = t.idTextoIA;
  
  console.log("");
  console.log("IDTEXTOIAAAA", idTextoIA);

  //texto.push(parrafo1, parrafo2);

  //console.log("TEXTO: ", res.locals.texto);
  
  res.redirect(`/ia/generadorIA/${req.params.nombreEscenario}/${req.params.nombrePersonaje}/${idTextoIA}`);
});


router.get('/generadorIA/:nombreEscenario/:nombrePersonaje/:idTextoIA', async function (req, res, next) {

  let texto = [];
  var parrafos = [];

  for (i = 1; i <= 30; i++) {
    parrafos.push("parrafo" + i);
  }

  console.log(parrafos);

  console.log(req.params.idTextoIA);
  let filter = { where: { idTextoIA: req.params.idTextoIA }, attributes: parrafos };
  texto = await Models.TextoIA.findAll(filter);




  res.locals.texto = texto;
//  res.locals.texto = texto;

  res.locals.title = "IA";
  res.locals.content = "texto/primerTexto";
   
  res.render('page');
});

/*
// NO SE USA
router.post('/generadorIA/:nombreEscenario/:nombrePersonaje', async function (req, res, next) {

  res.locals.content = "texto/primerTexto";

  res.render('page');
});
*/

module.exports = router;