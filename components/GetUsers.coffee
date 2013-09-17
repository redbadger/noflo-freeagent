noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetUsers extends FreeAgentComponent
  constructor: ->
    super

  doAsync: (token, callback) =>
    @requestApi token, 'getUsers', callback

exports.getComponent = -> new GetUsers
