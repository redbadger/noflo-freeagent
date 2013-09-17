noflo = require "noflo"
FreeAgent = require "node-freeagent2"

module.exports = class FreeAgentComponent extends noflo.AsyncComponent
  constructor: ->
    @sandbox = false
    @params = {}
    @inPorts = {}

    @inPorts.in = new noflo.Port
    @inPorts.sandbox = new noflo.Port
    @inPorts.page = new noflo.Port
    @inPorts.perpage = new noflo.Port

    @inPorts.sandbox.on 'data', (data) =>
      @sandbox = data
    @inPorts.page.on 'data', (data) =>
      @params.page = data
    @inPorts.perpage.on 'data', (data) =>
      @params.per_page = data

    @outPorts =
      out: new noflo.Port
    super

  requestApi: (token, method, callback) =>
    that = @

    if typeof token is "string"
      freeagent = new FreeAgent.Api(token, @sandbox)
      freeagent[method] @params, (error, data) ->
        if error
          that.outPorts.out.disconnect()
          return callback error
        else
          if that.outPorts.out.isAttached
            that.outPorts.out.send data
            that.outPorts.out.disconnect
            return callback

        that.outPorts.out.disconnect
        return callback
    else
      return callback new Error 'A valid token needs to be supplied to IN port.'


