define (require, exports, module) ->
  Marionette = require('marionette')
  LayoutView = require('app/Layout')
  MainController = require('app/MainController')

  App = new Marionette.Application()
  App.addRegions
    content: '#content'

  App.addInitializer ->
    layoutView = new LayoutView()
    new MainController
      region: App.content
      layoutView: layoutView

  module.exports = App

