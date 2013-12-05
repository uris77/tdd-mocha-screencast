define (require, exports, module) ->
  MainController = require('app/MainController')
  Layout = require('app/Layout')
  sinon = require('sinon')
  require('call')
  require('spy')

  describe 'The Application Main Controller', ->
    beforeEach ->
      fakeRegion = new Marionette.Region
        el: '#fake-region'
      @spy = sinon.spy(MainController.prototype, 'showHeader')
      @mainController = new MainController
        region: fakeRegion
        layoutView: new Layout()

    it 'renders the header', ->
      expect( @spy.calledOnce ).to.be true
