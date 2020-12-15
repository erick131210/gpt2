const { resolveInclude } = require('ejs');
var express = require('express');
const { ready } = require('jquery');
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

// POST GENERAR TEXTO Y ALMACENAR EN BD
router.post('/generadorIA/:nombreEscenario/:nombrePersonaje/1', async function (req, res, next) {

  let parrafo1 = await execShellCommand('cd gpt-2-Pytorch && python3 main.py --text "You are a ' + req.params.nombreEscenario + " " + req.params.nombrePersonaje + '"');

  parrafo1 = "You are " + req.body.nombreUsuario + parrafo1;
  console.log("PÁRRAFO 1:", parrafo1);

  let filter = { where: { idTextoIA: req.body.idTextoIA } };
  const [t, created] = await Models.TextoIA.findOrCreate(filter);

  t.idUsuario = req.session.usuario.idUsuario;
  t.nombreEscenario = req.params.nombreEscenario;
  t.nombrePersonaje = req.params.nombrePersonaje;
  t.nombreUsuario = req.body.nombreUsuario;
  t.parrafo1 = parrafo1;

  if (created) {
    t.estado = 1;
  }

  await t.save();

  let idTextoIA = t.idTextoIA;
  let idParrafo = "parrafo" + 1;


  res.redirect(`/ia/generadorIA/${req.params.nombreEscenario}/${req.params.nombrePersonaje}/${idTextoIA}/${idParrafo}`);
});

// POST GENERAR PÁRRAFO
router.post('/generadorIA/:nombreEscenario/:nombrePersonaje/:idTextoIA/:idParrafo', async function (req, res, next) {

  let filter = { where: { idTextoIA: req.params.idTextoIA } };
  const [t, created] = await Models.TextoIA.findOrCreate(filter);

  if (created) {
    t.estado = 1;
  }

  // VERIFICAR SI ES INGRESO NUEVO O REINICIO DE PÁRRAFO
  if (req.body.accion == "ingresar") {
    let numeroParrafoMasUno = Number(req.params.idParrafo.substring(7)) + Number(1);
    var idParrafo = "parrafo" + numeroParrafoMasUno;
    var nuevaAccion = req.body.accionTexto;
  } else if (req.body.accion == "reiniciar") {
    idParrafo = req.params.idParrafo;
    nuevaAccion = t.ultimaAccion;
  }

  // GENERAR PÁRRAFO NUEVO SEGÚN EL NÚMERO DE PÁRRAFO
  if (idParrafo == "parrafo1") {
    var parrafo1 = await execShellCommand(`cd gpt-2-Pytorch && python3 main.py --text "You are a ${req.params.nombreEscenario} ${req.params.nombrePersonaje}"`);

    parrafo1 = "You are " + t.nombreUsuario + parrafo1;
  } else {
    
    var parrafo = await execShellCommand(`cd gpt-2-Pytorch && python3 main.py --text "You are a ${req.params.nombreEscenario} ${req.params.nombrePersonaje}. You choose to ${nuevaAccion}."`);
    t.ultimaAccion = nuevaAccion;
  }

  if (idParrafo == "parrafo1") {
    t.parrafo1 = parrafo1;
  } else if (idParrafo == "parrafo2") {
    t.parrafo2 = parrafo;
  } else if (idParrafo == "parrafo3") {
    t.parrafo3 = parrafo;
  } else if (idParrafo == "parrafo4") {
    t.parrafo4 = parrafo;
  } else if (idParrafo == "parrafo5") {
    t.parrafo5 = parrafo;
  } else if (idParrafo == "parrafo6") {
    t.parrafo6 = parrafo;
  } else if (idParrafo == "parrafo7") {
    t.parrafo7 = parrafo;
  } else if (idParrafo == "parrafo8") {
    t.parrafo8 = parrafo;
  } else if (idParrafo == "parrafo9") {
    t.parrafo9 = parrafo;
  } else if (idParrafo == "parrafo10") {
    t.parrafo10 = parrafo;
  } else if (idParrafo == "parrafo11") {
    t.parrafo11 = parrafo;
  } else if (idParrafo == "parrafo12") {
    t.parrafo12 = parrafo;
  } else if (idParrafo == "parrafo13") {
    t.parrafo13 = parrafo;
  } else if (idParrafo == "parrafo14") {
    t.parrafo14 = parrafo;
  } else if (idParrafo == "parrafo15") {
    t.parrafo15 = parrafo;
  } else if (idParrafo == "parrafo16") {
    t.parrafo16 = parrafo;
  } else if (idParrafo == "parrafo17") {
    t.parrafo17 = parrafo;
  } else if (idParrafo == "parrafo18") {
    t.parrafo18 = parrafo;
  } else if (idParrafo == "parrafo19") {
    t.parrafo19 = parrafo;
  } else if (idParrafo == "parrafo20") {
    t.parrafo20 = parrafo;
  } else if (idParrafo == "parrafo21") {
    t.parrafo21 = parrafo;
  } else if (idParrafo == "parrafo22") {
    t.parrafo22 = parrafo;
  } else if (idParrafo == "parrafo23") {
    t.parrafo23 = parrafo;
  } else if (idParrafo == "parrafo24") {
    t.parrafo24 = parrafo;
  } else if (idParrafo == "parrafo25") {
    t.parrafo25 = parrafo;
  } else if (idParrafo == "parrafo26") {
    t.parrafo26 = parrafo;
  } else if (idParrafo == "parrafo27") {
    t.parrafo27 = parrafo;
  } else if (idParrafo == "parrafo28") {
    t.parrafo28 = parrafo;
  } else if (idParrafo == "parrafo29") {
    t.parrafo29 = parrafo;
  } else {
    t.parrafo30 = parrafo;
  }

  console.log("ANTES DE T.SAVE");

  await t.save();

  console.log("REQ.BODY");
  console.log(req.body);

  

  console.log("DESPUÉS DE T.SAVE");
 

  console.log("ENTRÓ EN PÁRRAFO", req.params.idParrafo);
  res.redirect(`/ia/generadorIA/${req.params.nombreEscenario}/${req.params.nombrePersonaje}/${req.params.idTextoIA}/${idParrafo}`);
});


// (GET) CARGAR VISTA Y MOSTRAR TEXTO CON PÁRRAFOS
router.get('/generadorIA/:nombreEscenario/:nombrePersonaje/:idTextoIA/:idParrafo', async function (req, res, next) {

  console.log("ENTRÓ EN GET GENERAR TEXTO Y MOSTRARLO");
  let texto = [];
  var parrafos = [];

  for (i = 1; i <= 30; i++) {
    parrafos.push("parrafo" + i);
  }

  parrafos.push("ultimaAccion");

  console.log(parrafos);
  console.log(req.params.idTextoIA);

  let filter = { where: { idTextoIA: req.params.idTextoIA }, attributes: parrafos };
  texto = await Models.TextoIA.findAll(filter);

  res.locals.texto = texto;

  console.log(req.params.idParrafo);

  res.locals.nombreEscenario = req.params.nombreEscenario;
  res.locals.nombrePersonaje = req.params.nombrePersonaje;
  res.locals.idTextoIA = req.params.idTextoIA;
  res.locals.idParrafo = req.params.idParrafo;
  res.locals.ultimaAccion = texto.ultimaAccion;
  res.locals.usuario = req.session.usuario.usuario;

  res.locals.title = "IA";
  res.locals.content = "texto/textoGenerado";

  res.render('page');
});


module.exports = router;