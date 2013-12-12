define (require, exports, module) ->
  BaseController = require('base/Controller')
  TitleView = require('app/Title')
  HeaderController = require('app/header/Header.Controller')
  UserRepository = require('app/repositories/User.Repository')
  InvoiceFormController = require('app/invoice/InvoiceFormController')

  class MainController extends BaseController
    initialize: (options) ->
      super()
      @region = options.region
      @layoutView = options.layoutView
      @userRepository = new UserRepository()
      @region.show @layoutView
      @showTitleView()
      @showHeader()
      @userRepository.getById(1).done()
      @startModule 'HOME'

    showHeader: ->
      @headerController = new HeaderController
        region: @layoutView.headerRegion
        repository: @userRepository
      @headerController.vent.on 'menu:click', @startModule

    getTitleView: ->
      unless @titleView
        @titleView = new TitleView()
      @_currentView = @titleView
      @titleView

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()

    getCurrentModule: -> @_currentModule

    getCurrentView: ->
      @_currentView

    startModule: (moduleName) =>
      if @getCurrentModule() then @stopModule(@getCurrentModule())
      switch(moduleName)
        when 'HOME'
          @showTitleView()
          @_currentModule = {name: moduleName, controller: @getTitleView()}
        when "INVOICE"
          @_currentModule =
            name: moduleName
            controller: new InvoiceFormController
              region: @layoutView.centerRegion
          @_currentView = @_currentModule.controller.layout

    stopModule: (module) ->
      module.controller.close()
      delete module.controller

  module.exports = MainController

