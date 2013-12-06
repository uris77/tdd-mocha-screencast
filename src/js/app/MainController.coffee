define (require, exports, module) ->
  BaseController = require('base/Controller')
  TitleView = require('app/Title')
  HeaderController = require('app/header/Header.Controller')
  UserRepository = require('app/repositories/User.Repository')

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
      new HeaderController
        region: @layoutView.headerRegion
        repository: @userRepository

    getTitleView: ->
      unless @titleView
        @titleView = new TitleView()
      @titleView

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()

  module.exports = MainController

