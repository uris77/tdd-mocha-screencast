define (require, exports, module) ->
  HeaderController = require('app/header/Header.Controller')
  UserRepository = require('app/repositories/User.Repository')

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

    it 'Show Calculate Bill menu item', ->
      expect( @controller.layout.leftHeader.$el.html() )
        .match(/Calculate Bill/).to.be.ok

    it 'Shows user name on right menu', ->
      @spy = sinon.spy(@controller.layout.rightHeader, 'show')
      @controller.showRightHeader()
      expect( @spy.calledOnce ).to.be true
      @spy.restore()
