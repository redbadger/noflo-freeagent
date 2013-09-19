noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetInvoices extends FreeAgentComponent
  constructor: ->
    super

    @inPorts.view = new noflo.Port

    @inPorts.view.on 'data', (data) =>
      @params.view = data

  doAsync: (data, callback) =>
    @getData 'getInvoices', callback

exports.getComponent = -> new GetInvoices
