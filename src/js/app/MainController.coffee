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

    showHeader: ->
      @headerController = new HeaderController
        region: @layoutView.headerRegion
        repository: @userRepository
      @headerController.vent.on 'menu:click', @startComponent

    getTitleView: ->
      unless @titleView
        @titleView = new TitleView()
      @_currentView = @titleView
      @titleView

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()

    startComponent: (componentName) =>
      if @currentComponent then @currentComponent.instance.close()
      switch componentName
        when 'HOME'
          @currentComponent =
            name: componentName
            instance: @getTitleView()
          @currentVIew = @getTitleView()
          @showTitleView()
        when 'INVOICE'
          @currentComponent =
            name: componentName
            instance: new InvoiceFormController
              region: @layoutView.centerRegion
          @currentView = @currentComponent.instance.layout

  module.exports = MainController

