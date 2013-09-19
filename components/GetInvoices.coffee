noflo = require "noflo"
FreeAgentComponent = require "./FreeAgentComponent"

class GetInvoices extends FreeAgentComponent
  constructor: ->
    super

  doAsync: (params, callback) =>
    @getData 'getInvoices', callback

exports.getComponent = -> new GetInvoices
