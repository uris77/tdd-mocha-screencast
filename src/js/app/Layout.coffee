define ['marionette', 'templates/layout'], (Marionette) ->
  class Layout extends Marionette.Layout
    template: (obj) -> JST['layout.hbs'](obj)
    regions:
      headerRegion: '#header'
      centerRegion: '#center'
      footerRegion: '#footer'
