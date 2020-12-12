var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var flash = require('express-flash');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var mysqlSession = require('express-mysql-session')(session);
var config = require('./config/config');


// Importar gpt2-generador.js para utilizar su método.
require('./gpt2-generador');
/*
// CREAR FUNCIÓN ANÓNIMA (SE UTILIZA UNA SOLA VEZ) QUE LLAMARÁ A EXECSHELLCOMMAND Y ASIGNARÁ EL VALOR RESULTANTE A TEXTO, PARA LUEGO MOSTRARLO EN LA TERMINAL DE UBUNTU.
(async function() {
  let texto = await execShellCommand('cd gpt-2-Pytorch && python3 main.py --text "table green"');
  console.log(texto);
  console.log("");
  console.log("FIN");

}());
*/


var app = express();

let sessionStore = new mysqlSession(config.mysqlSession);

app.use(session({
  key: 'session_cookie_name',
  secret: 'session_cookie_secret',
  store: sessionStore,
  resave: false,
  saveUninitialized: false
}));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use( session ({
  secret: 'session',
  cookie: {}
}));

app.use(flash());

// Importar Models de models.js y permitir su uso en cualquier componente.
Models = require('./models');


app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
