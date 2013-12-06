define (require, exports, module) ->
  Controller = require('base/Controller')
  HeaderLayout = require('app/header/HeaderLayout')
  MenuItemsView = require('app/header/MenuItemsView')
  MenuItems = require('app/header/MenuItems')
  RightMenuView = require('app/header/Header.RightMenu')

  class HeaderController extends Controller
    initialize: (options)->
      super()
      @region = options.region
      @repository = options.repository
      @repository.onFetched @showRightHeader
      @layout = new HeaderLayout()
      menuItemsView = new MenuItemsView
        collection: new MenuItems()
      @region.show @layout
      @layout.leftHeader.show menuItemsView

    showRightHeader: =>
      rightMenuView = new RightMenuView
        model: @repository.getUser()
      @layout.rightHeader.show rightMenuView

  module.exports = HeaderController

