// server.js - Express server
// ------------------ BEGIN MODULE SCOPE VARIABLES ---------------------
/* jslint node: true */
'use strict';

var
    http       = require('http'),
    express    = require('express'),
    routes     = require('./routes'),
    app        = express();
    //server     = http.createServer(app);
// ------------------ END MODULE SCOPE VARIABLES ---------------------

//------------------ BEGIN SERVER CONFIGURATION ---------------------
app.configure(function () {
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.static(__dirname + '/../build/'));
    app.use(express.static(__dirname + '/../vendor/'));
    app.use(app.router);
});
//------------------ END SERVER CONFIGURATION ---------------------

//------------------ BEGIN START SERVER ---------------------------
routes.configRoutes(app);
app.listen(9090);
/*console.log(
        'Express server listening on port %d in %s mode',
        server.address(), 3000
);*/
//------------------ END START SERVER ---------------------------

module.exports = app;

