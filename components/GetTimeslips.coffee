noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetTimeslips extends FreeAgentComponent
  constructor: ->
    super

    @inPorts.from = new noflo.Port
    @inPorts.to = new noflo.Port

    @inPorts.from.on 'data', (data) =>
      @params.from_date = data
    @inPorts.to.on 'data', (data) =>
      @params.to_date = data

  doAsync: (token, callback) =>
    @getData token, 'getTimeslips', callback

exports.getComponent = -> new GetTimeslips
