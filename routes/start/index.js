var express = require('express');
var router = express.Router();

// Cargar la vista start.ejs con las variables title.
router.get('/start', function(req, res, next) {

  res.locals.title = "Web Login";
  
  res.render('start/start');
});

module.exports = router;