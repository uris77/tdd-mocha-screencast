define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/header/menuItems')

  Views = {}

  class Views.MenuItemView extends Marionette.ItemView
    template: (obj) -> JST['menuItems.hbs'](obj)
    tagName: 'a'
    className: ->
      if @model.get('selected')
        'item active'
      else
        'item'

    events:
      'click ': 'selectItem'

    selectItem: (domEvent) ->
      domEvent.preventDefault()
      unless @model.get('selected')
        @model.set('selected', true)
        @trigger 'select', @model


  class Views.MenuItemsView extends Marionette.CollectionView
    className: 'section ui'
    itemView: Views.MenuItemView

  module.exports = Views

