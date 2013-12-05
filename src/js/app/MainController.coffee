define (require, exports, module) ->
  BaseController = require('base/Controller')
  TitleView = require('app/Title')
  HeaderController = require('app/header/Header.Controller')

  class MainController extends BaseController
    initialize: (options) ->
      super()
      @region = options.region
      @layoutView = options.layoutView
      @region.show @layoutView
      @showTitleView()
      @showHeader()

    showHeader: ->
      new HeaderController
        region: @layoutView.headerRegion

    getTitleView: ->
      unless @titleView
        @titleView = new TitleView()
      @titleView

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()

  module.exports = MainController

