define (require, exports, module) ->
  BaseController = require('base/Controller')
  TitleView = require('app/Title')

  class MainController extends BaseController
    initialize: (options) ->
      super()
      @region = options.region
      @layoutView = options.layoutView
      @region.show @layoutView
      @showTitleView()

    getTitleView: ->
      unless @titleView
        @titleView = new TitleView()
      @titleView

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()

  module.exports = MainController

