define (require, exports, module) ->
  Controller = require('base/Controller')
  HeaderLayout = require('app/header/HeaderLayout')
  MenuItemsViews = require('app/header/MenuItemsView')
  MenuItems = require('app/header/MenuItems')
  RightMenuView = require('app/header/Header.RightMenu')

  class HeaderController extends Controller
    initialize: (options)->
      super()
      @region = options.region
      @repository = options.repository
      @repository.onFetched @showRightHeader
      @layout = new HeaderLayout()
      @region.show @layout
      @showMenuItems()
      @layout.leftHeader.show @menuItemsView

    showMenuItems: ->
      @menuItems = new MenuItems()
      @menuItemsView = new MenuItemsViews.MenuItemsView
        collection: @menuItems
      @menuItemsView.on 'itemview:select', @menuItemHandler

    menuItemHandler: (childview, model) =>
      _.each(@menuItems.models, (it) ->
        if it.get('name') isnt model.get('name')
          it.set('selected', false)
      )
      @menuItemsView.render()

    showRightHeader: =>
      rightMenuView = new RightMenuView
        model: @repository.getUser()
      @layout.rightHeader.show rightMenuView

  module.exports = HeaderController

