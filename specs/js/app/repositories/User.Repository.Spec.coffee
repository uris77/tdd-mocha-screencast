define (require, exports, module) ->
  UserRepository = require('app/repositories/User.Repository')
  Q = require('q')

  describe 'User Repository', ->
    it 'GET user from server', ->
      repository = new UserRepository()
      simulatedServerResponse =
        id: 1
        name: 'Firstname Lastname'
        api: 1234567
      $.ajax = -> Q(simulatedServerResponse)
      userPromise = repository.getById(1)
      userPromise.then (user) ->
        expect( user.get('id') ).to.be 1

