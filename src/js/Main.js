/*jshint node: true */
'use strict';
require.config({
    baseUrl: 'js',
    findNestedDependencies: true,
    name: 'Main',
    paths: {
        jquery: '../jquery/jquery',
        underscore: '../underscore/underscore',
        backbone: '../backbone/backbone',
        marionette: '../backbone.marionette/lib/backbone.marionette',
        handlebars: '../handlebars/handlebars',
        handlebars_runtime: '../handlebars/handlebars_runtime',
        'backbone.wreqr': '../backbone.wreqr/lib/backbone.wreqr'
    },

    shim: {
        jquery: { exports: 'jQuery' },
        underscore: { exports: '_' },
        backbone: {
            deps: ['jquery', 'underscore', 'json2'],
            exports: 'Backbone'
        },
        marionette: {
            deps: ['backbone'],
            exports: 'Marionette'
        },
        'backbone.wreqr': {
            deps: ['backbone'],
            exports: 'Backbone.Wreqr'
        },
        handlebars: { exports: 'Handlebars' }
    },

    packages: [
        {
            name: 'json2',
            location: '../backbone.marionette/public/javascripts',
            main: 'json2'
        },
        {
            name: 'q',
            location: '../q',
            main: 'q'
        }
    ]
});

require(['App'], function (App) {
    App.start();
});

