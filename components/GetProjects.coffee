noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetProjects extends FreeAgentComponent
  constructor: ->
    super
  doAsync: (params, callback) =>
    @getData 'getProjects', callback

exports.getComponent = -> new GetProjects
