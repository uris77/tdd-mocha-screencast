define ['marionette', 'templates/title'], (Marionette) ->
  class TitleView extends Marionette.ItemView
    className: 'ui segment'
    template: (obj) -> JST['title.hbs'](obj)

