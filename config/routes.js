/* routes.js - module to provide routing
 */
//-------------- BEGIN MODULE SCOPE VARIABLES -----------------
/* jslint node: true */
'use strict';
var configRoutes;
var RestClient = require('node-rest-client').Client;
var moment = require('moment');
var url = require('url');
var user = require(process.env.HOME + '/.hodor/config').user;
//--------------- END MODULE SCOPE VARIABLES -------------------

//---------------- BEGIN PUBLIC METHODS -----------------------

configRoutes = function (app) {
    app.get('/', function (request, response) {
        response.redirect('/index.html');
    });

    app.get('/user/:id', function (requrest, response) {
        response.contentType('json');
        response.send(user);
    });

    app.get('/timeEntries/apiKey', function (request, resposne) {
        var urlParts = url.parse(request.url, true);
        var dateFormat = 'DD-MM-YYYY';
        var IsoDateFormat = 'YYYY-MM-DD';
        var startDate = moment.utc(urlParts.query.startDate, dateFormat);
        var endDate = moment.utc(urlParts.query.endDate, dateFormat);
        var baseUrl = 'https://wwww.toggle.com/api/v8/time_entries?';
        var _url = baseUrl + 'start_date=' + startDate.format(IsoDateFormat) +
            'T00:00-00-00:00&end_date=' + endDate.format(IsoDateFormat) +
            'T23:59:59-59:59';
        var options_auth = {user: request.params.apiKey, password: 'api_token'};
        var client = new RestClient(options_auth);
        client.get(_url, function (data, response) {
            response.json(data);
        });

    });
};
module.exports = { configRoutes: configRoutes };

//---------------- END PUBLIC METHODS -------------------------

