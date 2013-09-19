noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetProjects extends FreeAgentComponent
  constructor: ->
    super

    @inPorts.view = new noflo.Port

    @inPorts.view.on 'data', (data) =>
      @params.view = data

  doAsync: (data, callback) =>
    @getData 'getProjects', callback

exports.getComponent = -> new GetProjects
