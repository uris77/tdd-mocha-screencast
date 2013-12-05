define (require, exports, module) ->
  Controller = require('base/Controller')
  HeaderLayout = require('app/header/HeaderLayout')
  MenuItemsView = require('app/header/MenuItemsView')
  MenuItems = require('app/header/MenuItems')

  class HeaderController extends Controller
    initialize: (options)->
      super()
      @region = options.region
      @layout = new HeaderLayout()
      menuItemsView = new MenuItemsView
        collection: new MenuItems()
      @region.show @layout
      @layout.leftHeader.show menuItemsView

  module.exports = HeaderController

