define (require, exports, module) ->
  Backbone = require('backbone')
  MenuItem = require('app/header/MenuItem')

  class MenuItems extends Backbone.Collection
    model: MenuItem
    items:
      HOME:       new MenuItem(name: 'Home', selected: true)
      INVOICE:   new MenuItem(name: 'Invoice')
    initialize: ->
      @add @items.HOME
      @add @items.INVOICE

    getItemKeyFor: (item) ->
      for prop of @items
        if @items.hasOwnProperty(prop)
          if @items[prop] is item
            return prop

  module.exports = MenuItems

