define (require, exports, module) ->
  MainController = require('app/MainController')
  Layout = require('app/Layout')
  sinon = require('sinon')
  require('call')
  require('spy')
  require('stub')

  describe 'The Application Main Controller', ->
    fakeRegion = new Marionette.Region
      el: '#content'

    beforeEach ->
      @stub = sinon.stub(MainController.prototype, 'showHeader')
      @mainController = new MainController
        region: fakeRegion
        layoutView: new Layout()

    afterEach ->
      @stub.restore()

    it 'renders the header', ->
      expect( @stub.calledOnce ).to.be true

