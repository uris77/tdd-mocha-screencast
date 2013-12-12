define (require, exports, module) ->
  HeaderController = require('app/header/Header.Controller')
  UserRepository = require('app/repositories/User.Repository')
  MenuItemModel = require('app/header/MenuItem')

  describe 'Application Header', ->
    beforeEach ->
      fakeRegion = new Marionette.Region
        el: '#fake-region'
      repository = new UserRepository()
      @controller = new HeaderController
        region: fakeRegion
        repository: repository

    it 'Show Home menu item', ->
      expect( @controller.layout.leftHeader.$el.html() )
        .match(/Home/).to.be.ok

    it 'Show Invoice menu item', ->
      expect( @controller.layout.leftHeader.$el.html() )
        .match(/Invoice/).to.be.ok

    it 'Shows user name on right menu', ->
      @spy = sinon.spy(@controller.layout.rightHeader, 'show')
      @controller.showRightHeader()
      expect( @spy.calledOnce ).to.be true
      @spy.restore()

    it 'unselects menu items that are not selcted', ->
      invoiceModel = new MenuItemModel
        name: 'Invoice'
        selected: true
      homeModel = _.find(@controller.menuItems.models, (it) -> it.get('name') == 'Home')
      expect( homeModel.get('selected') ).to.be true
      @controller.menuItemHandler({}, invoiceModel)
      expect( homeModel.get('selected') ).to.be false

