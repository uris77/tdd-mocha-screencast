define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/invoice/invoiceFormLayout')

  class InvoiceFormLayout extends Marionette.Layout
    template: (obj) -> JST['invoiceFormLayout.hbs'](obj)
    regions:
      'formRegion': '#form-region'
      'errors-region': '#errors-region'

  module.exports = InvoiceFormLayout

