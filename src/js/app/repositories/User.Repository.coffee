define (require, exports, module) ->
  Q = require('q')
  Backbone = require('backbone')

  class User extends Backbone.Model
    urlRoot: '/user'

  class UserRepository
    constructor: ->
      @vent = _.extend {}, Backbone.Events

    onFetched: (handler) ->
      @vent.on 'user:fetched', handler

    getById: (id) ->
      @_user = new User(id: id)
      Q.when(@_user.fetch())
        .then =>
          @vent.trigger 'user:fetched'
          @_user

    getUser: -> @_user

  module.exports = UserRepository
