define (require, exports, module) ->
  Marionette = require('marionette')
  InvoiceFormController = require('app/invoice/InvoiceFormController')
  sinon = require('sinon')
  require('call')
  require('spy')

  describe 'Invoice Form Controller', ->
    beforeEach ->
      fakeRegion = new Marionette.Region
        el: '#fake-region'
      @regionSpy = sinon.spy(Marionette.Region.prototype, 'show')
      @showFormSpy = sinon.spy(InvoiceFormController.prototype, 'showForm')
      @mainController = new InvoiceFormController
        region: fakeRegion

    afterEach ->
      @regionSpy.restore()
      @showFormSpy.restore()

    it 'render the invoice form', ->
      expect( @regionSpy.called ).to.be true
      expect( @showFormSpy.called ).to.be true


