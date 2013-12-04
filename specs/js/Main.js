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
        'backbone.wreqr': '../backbone.wreqr/lib/backbone.wreqr',
        handlebars: '../handlebars/handlebars',
        handlebars_runtime: '../handlebars/handlebars.runtime',
        expect: 'expect/expect',
        sinon: '../sinon/lib/sinon',
        spy: '../sinon/lib/sinon/spy',
        stub: '../sinon/lib/sinon/stub',
        call: '../sinon/lib/sinon/call',
        mock: '../sinon/lib/sinon/mock'
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
        handlebars: { exports: 'Handlebars' },
        sinon: { exports: 'sinon' },
        spy: {
            deps: ['sinon'],
            exports: 'sinon'
        },
        stub: {
            deps: ['sinon'],
            exports: 'sinon'
        },
        call: {
            deps: ['sinon'],
            exports: 'sinon'
        },
        mock: {
            deps: ['sinon'],
            exports: 'sinon'
        }
                
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
        },
        {
           name: 'chai',
           location: '../chai',
           main: 'chai'
        },
        {
            name: 'chai-as-promised',
            location: '../chai-as-promised/lib',
            main: 'chai-as-promised'
        }
    ]
});

var specs = [
    'specs/header/Header.Spec',
    'specs/Main.Controller.Spec',
    'specs/repositories/User.Repository.Spec'
    ];
require(specs, function () {
    if (typeof mochaPhantomJS !== 'undefined') {
        mochaPhantomJS.run();
    } else {
        mocha.run();
    }
});

