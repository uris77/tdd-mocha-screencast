define (require, exports, module) ->
  MainController = require('app/MainController')
  Layout = require('app/Layout')
  TitleView = require('app/Title')
  InvoiceFormController = require('app/invoice/InvoiceFormController')
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

    describe 'Switch views for center region', ->
      context 'when the Home component is started', ->
        beforeEach ->
          @mainController.startComponent('HOME')
        it 'then current component should be "HOME"', ->
          expect( @mainController.currentComponent.name ).to.be 'HOME'
        it 'and the home component has an instance of TitleView', ->
          expect( @mainController.currentComponent.instance instanceof TitleView )
            .to.be true

        context 'when the invoice component is started', ->
          beforeEach ->
            @mainController.startComponent('INVOICE')
          it 'then current component should be "INVOICE"', ->
            expect( @mainController.currentComponent.name ).to.be 'INVOICE'
          it 'and the home component has an instance of InvoiceFormController', ->
            expect( @mainController.currentComponent.instance instanceof InvoiceFormController )
              .to.be true
          it 'and the invoice form is rendered', ->
            expect( @mainController.currentView.$el.html() )
              .match(/Invoice Form/).to.be.ok
            expect( @mainController.currentView.$el.html() )
              .match(/Start Date/).to.be.ok
            expect( @mainController.currentView.$el.html() )
              .match(/End Date/).to.be.ok

        describe 'When a component is started', ->
          context 'and there is a previously initialized component', ->
            beforeEach ->
              @invoiceStub = sinon.stub(InvoiceFormController.prototype, 'close')
              @mainController.startComponent( 'INVOICE' )
              @mainController.startComponent( 'HOME' )
            afterEach ->
              @invoiceStub.restore()
            it 'closes the current component before starting the new on', ->
              expect( @invoiceStub.calledOnce ).to.be true
              


