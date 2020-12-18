const { Sequelize, DataTypes, Op } = require('sequelize');

const sequelize = new Sequelize('mysql://doadmin:xc0s5az95sidsvnu@db-mysql-sfo2-95666-do-user-8446385-0.b.db.ondigitalocean.com:25060/defaultdb', {
  define: {
    freezeTableName: true
  }
});   // Definir el motor de BD.

const Models = {};

// Definir la tabla usuario.
Models.Usuario = sequelize.define('usuario', {
  idUsuario: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  nombreUsuario: {
    type: DataTypes.STRING
  },
  apellidoUsuario: {
    type: DataTypes.STRING
  },
  tipoUsuario: {
    type: DataTypes.STRING
  },
  usuario: {
    type: DataTypes.STRING
  },
  password: {
    type: DataTypes.STRING
  },
  estado: {
    type: DataTypes.TINYINT
  }
});

Models.Personaje = sequelize.define('personaje', {
  idPersonaje: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  nombrePersonaje: {
    type: DataTypes.STRING
  },
  estado: {
    type: DataTypes.TINYINT
  }
});

Models.Escenario = sequelize.define('escenario', {
  idEscenario: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  nombreEscenario: {
    type: DataTypes.STRING
  },
  estado: {
    type: DataTypes.TINYINT
  }
});

Models.TextoIA = sequelize.define('textoIA', {
  idTextoIA: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  idUsuario: {
    type: DataTypes.INTEGER,
    model: this.Usuario,
    key: 'idUsuario'
  },
  nombreEscenario: {
    type: DataTypes.STRING
  },
  nombrePersonaje: {
    type: DataTypes.STRING
  },
  nombreUsuario: {
    type: DataTypes.STRING
  },
  ultimaAccion: {
    type: DataTypes.STRING
  },
  estado: {
    type: DataTypes.TINYINT
  },
  parrafo1: {
    type: DataTypes.TEXT
  },
  parrafo2: {
    type: DataTypes.TEXT
  },
  parrafo3: {
    type: DataTypes.TEXT
  },
  parrafo4: {
    type: DataTypes.TEXT
  },
  parrafo5: {
    type: DataTypes.TEXT
  },
  parrafo6: {
    type: DataTypes.TEXT
  },
  parrafo7: {
    type: DataTypes.TEXT
  },
  parrafo8: {
    type: DataTypes.TEXT
  },
  parrafo9: {
    type: DataTypes.TEXT
  },
  parrafo10: {
    type: DataTypes.TEXT
  },
  parrafo11: {
    type: DataTypes.TEXT
  },
  parrafo12: {
    type: DataTypes.TEXT
  },
  parrafo13: {
    type: DataTypes.TEXT
  },
  parrafo14: {
    type: DataTypes.TEXT
  },
  parrafo15: {
    type: DataTypes.TEXT
  },
  parrafo16: {
    type: DataTypes.TEXT
  },
  parrafo17: {
    type: DataTypes.TEXT
  },
  parrafo18: {
    type: DataTypes.TEXT
  },
  parrafo19: {
    type: DataTypes.TEXT
  },
  parrafo20: {
    type: DataTypes.TEXT
  },
  parrafo21: {
    type: DataTypes.TEXT
  },
  parrafo22: {
    type: DataTypes.TEXT
  },
  parrafo23: {
    type: DataTypes.TEXT
  },
  parrafo24: {
    type: DataTypes.TEXT
  },
  parrafo25: {
    type: DataTypes.TEXT
  },
  parrafo26: {
    type: DataTypes.TEXT
  },
  parrafo27: {
    type: DataTypes.TEXT
  },
  parrafo28: {
    type: DataTypes.TEXT
  },
  parrafo29: {
    type: DataTypes.TEXT
  },
  parrafo30: {
    type: DataTypes.TEXT
  }
});

Models.Sessions = sequelize.define('sessions', {
  session_id: {
      type: DataTypes.STRING,
      primaryKey: true
  },
  expires: {
      type: DataTypes.INTEGER
  },
  data: {
      type: DataTypes.TEXT
  }
});



// Exportar la constante Models.
module.exports = Models;

