var express = require('express');
//const { Sequelize } = require('sequelize/types');
const { Sequelize, DataTypes, Op } = require('sequelize'); //Cargamos la Libreria
const Models = require('../../models');
var router = express.Router();

//========================== DOCENTE ==========================


router.get('/logout', function (req, res, next) {
  
    req.session.usuario = undefined;
  
    res.redirect("/ia/login");
    return;
  });


// LISTAR ALUMNO
router.get("/list", async function (req, res, next) {

    res.locals.content = 'panelDeControl/list';
    res.locals.tituloForm = 'Lista de Alumnos';
    res.locals.title = 'Panel De Control';

    let apellidos = [];
    res.locals.search = '';
    let filter = { where: { estado: 1, tipoUsuario: "alumno" } };
    alumnos = await Models.Usuario.findAll(filter);

    if (req.query.search) {
        for (usuario of alumnos) {
            encontrado = usuario.apellidoUsuario.toUpperCase().includes(req.query.search.toUpperCase());
            
            if (encontrado) {
                apellidos.push(usuario.apellidoUsuario);
            }
        }

        filter.where.apellidoUsuario = apellidos;
    }

    res.locals.usuarios = await Models.Usuario.findAll(filter);
    
    res.render('page');
});


// CREAR ALUMNO
router.get("/create", async function (req, res, next) {

    res.locals.content = 'panelDeControl/form';
    res.locals.tituloForm = 'Registrar Alumno';
    res.locals.title = 'Registrar Alumno';

    res.locals.obj = Models.Usuario.build();

    res.render('page');
});


// GUARDAR ALUMNO POST
router.post("/save", async function (req, res, next) {

    let filter = { where: { idUsuario: req.body.idUsuario } };
    const [u, created] = await Models.Usuario.findOrCreate(filter);

    console.log("");
    console.log(req.body);

    u.nombreUsuario = req.body.nombreUsuario;
    u.apellidoUsuario = req.body.apellidoUsuario;
    u.usuario = req.body.usuario;
    u.password = req.body.password;
    u.tipoUsuario = "alumno";

    if (created) {
        u.estado = 1;
    }

    await u.save();

    res.redirect("/panelDeControl/list");
});


// EDITAR ALUMNO
router.get("/edit/:idUsuario", async function (req, res, next) {

    res.locals.usuario = { idUsuario: req.params.idUsuario };
    res.locals.content = 'panelDeControl/form';

    res.locals.tituloForm = 'Editar Alumno';
    res.locals.title = 'Editar Alumno';

    res.locals.obj = await Models.Usuario.findByPk(req.params.idUsuario);

    res.render('page');
});


// ELIMINAR ALUMNO
router.get("/delete/:idUsuario", async function (req, res, next) {

    res.locals.usuario = { idUsuario: req.params.idUsuario };
    res.locals.content = 'panelDeControl/delete';

    res.locals.tituloForm = 'Eliminar Alumno';
    res.locals.title = 'Eliminar Alumno';

    res.locals.obj = await Models.Usuario.findByPk(req.params.idUsuario);

    res.render('page');
});


// ELIMINAR ALUMNO POST
router.post("/delete/:idUsuario", async function (req, res, next) {

    let obj = await Models.Usuario.findByPk(req.params.idUsuario);
    obj.estado = 0;
    await obj.save();

    res.redirect("/panelDeControl/list");
});


module.exports = router;