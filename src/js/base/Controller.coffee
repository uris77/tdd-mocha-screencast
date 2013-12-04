define (require, exports, module) ->
  Marionette = require('marionette')
  Backbone.Wreqr = require('backbone.wreqr')

  class Controller extends Marionette.Controller
    initialize: (args) ->
      @vent = new Backbone.Wreqr.EventAggregator()
      @commands = new Backbone.Wreqr.Commands()
      @reqres = new Backbone.Wreqr.RequestResponse()

  module.exports = Controller

