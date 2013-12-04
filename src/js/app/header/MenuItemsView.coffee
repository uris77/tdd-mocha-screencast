define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/header/menuItems')

  class MenuItemView extends Marionette.ItemView
    template: (obj) -> JST['menuItems.hbs'](obj)
    tagName: 'a'
    className: ->
      if @model.get('selected')
        'item active'
      else
        'item'

    events:
      'click ': 'selectMenuItem'

    selectMenuItem: (domEvent) ->
      domEvent.preventDefault()
      unless @model.get 'selected'
        @model.set 'selected', true
        @trigger 'select', @model


  class MenuItemsView extends Marionette.CollectionView
    className: 'section ui'
    itemView: MenuItemView

  module.exports = MenuItemsView

