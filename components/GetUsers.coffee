noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetUsers extends FreeAgentComponent
  constructor: ->
    super

  doAsync: (token, callback) =>
    @getData token, 'getUsers', callback

exports.getComponent = -> new GetUsers
