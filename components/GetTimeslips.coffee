noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetTimeslips extends FreeAgentComponent
  constructor: ->
    super

    @inPorts.from = new noflo.Port
    @inPorts.to = new noflo.Port

    @inPorts.from.on 'data', (data) =>
      @params.from = data
    @inPorts.to.on 'data', (data) =>
      @params.to = data

  doAsync: (token, callback) =>
    @requestApi token, 'getTimeslips', callback

exports.getComponent = -> new GetTimeslips
