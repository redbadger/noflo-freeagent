noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetTimeslips extends FreeAgentComponent
  constructor: ->
    super

  doAsync: (callback) =>
    @getData 'getTimeslips', callback

exports.getComponent = -> new GetTimeslips
