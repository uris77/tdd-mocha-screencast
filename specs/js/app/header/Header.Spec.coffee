define (require, exports, module) ->
  HeaderController = require('app/header/Header.Controller')

  describe 'Application Header', ->
    beforeEach ->
      fakeRegion = new Marionette.Region
        el: '#fake-region'
      @controller = new HeaderController
        region: fakeRegion

    it 'Show Home menu item', ->
      expect( @controller.layout.leftHeader.$el.html() )
        .match(/Home/).to.be.ok

    it 'Show Calculate Bill menu item', ->
      expect( @controller.layout.leftHeader.$el.html() )
        .match(/Calculate Bill/).to.be.ok

