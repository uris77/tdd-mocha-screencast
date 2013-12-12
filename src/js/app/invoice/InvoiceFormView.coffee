define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/invoice/invoiceForm')

  class InvoiceFormView extends Marionette.Layout
    template: (obj) -> JST['invoiceForm.hbs'](obj)
    className: 'ui inverted form segment'

  module.exports = InvoiceFormView

