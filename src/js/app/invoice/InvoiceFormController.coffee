define (require, exports, module) ->
  Controller = require('base/Controller')
  Layout = require('app/invoice/InvoiceFormLayout')
  InvoiceFormView = require('app/invoice/InvoiceFormView')

  class InvoiceFormController extends Controller
    initialize: (options) ->
      super()
      @region = options.region
      @layout = new Layout()
      @region.show @layout
      @showForm()

    showForm: ->
      @invoiceFormView = new InvoiceFormView()
      @layout.formRegion.show @invoiceFormView


  module.exports = InvoiceFormController

