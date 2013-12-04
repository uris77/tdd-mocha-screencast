define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/header/headerLayout')

  class HeaderLayout extends Marionette.Layout
    template: (obj) -> JST['headerLayout.hbs'](obj)
    className: 'ui inverted menu'
    regions:
      leftHeader: '#left-header'
      rightHeader: '#right-header'

  module.exports = HeaderLayout

