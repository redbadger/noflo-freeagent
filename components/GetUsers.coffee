noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetUsers extends FreeAgentComponent
  constructor: ->
    super

  doAsync: (data, callback) =>
    @getData 'getUsers', callback

exports.getComponent = -> new GetUsers
