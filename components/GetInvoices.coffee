noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetInvoices extends FreeAgentComponent
  constructor: ->
    super

    @inPorts.view = new noflo.Port

    @inPorts.view.on 'data', (data) =>
      @params.view = data

  doAsync: (token, callback) =>
    @requestApi token, 'getInvoices', callback

exports.getComponent = -> new GetInvoices
