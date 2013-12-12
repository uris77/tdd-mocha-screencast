define (require, exports, module) ->
  MenuItemViews = require('app/header/MenuItemsView')
  MenuItemModel = require('app/header/MenuItem')
  Marionette = require('marionette')
  sinon = require('sinon')
  require('call')
  require('spy')

  domEvent =
    preventDefault: -> return

  describe 'Header Menu Item', ->
    beforeEach ->
      @fakeRegion = new Marionette.Region
        el: '#fake-region'
      @homeMenuModel = new MenuItemModel
        name: 'Home'
        selected: false
      @view = new MenuItemViews.MenuItemView
        model: @homeMenuModel
      @fakeRegion.show @view

    it 'activates a menu item view when it is clicked', ->
      @view.selectItem(domEvent)
      expect( @homeMenuModel.get('selected') ).to.be true

    it 'when menu item is selected it ignores the click event', ->
      modelSpy = sinon.spy(Backbone.Model.prototype, 'set')
      @view.selectItem(domEvent)
      @view.selectItem(domEvent)
      expect( modelSpy.callCount ).to.be 1
      modelSpy.restore()


