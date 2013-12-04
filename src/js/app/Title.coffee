define ['marionette', 'templates/title'], (Marionette) ->
  class Title extends Marionette.ItemView
    className: 'ui segment'
    template: (obj) -> JST['title.hbs'](obj)
