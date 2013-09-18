noflo = require "noflo"
FreeAgent = require "node-freeagent2"

module.exports = class FreeAgentComponent extends noflo.AsyncComponent
  constructor: ->
    @sandbox = false
    @inPorts = {}

    @results = []
    @params = {}
    @params.page = 1
    @params.perpage = 50

    @inPorts.in = new noflo.Port
    @inPorts.sandbox = new noflo.Port
    @inPorts.page = new noflo.Port 'int'
    @inPorts.perpage = new noflo.Port 'int'

    @inPorts.sandbox.on 'data', (data) =>
      @sandbox = data
    @inPorts.page.on 'data', (data) =>
      @params.page = parseInt data
    @inPorts.perpage.on 'data', (data) =>
      @params.per_page = parseInt data

    @outPorts =
      out: new noflo.Port
    super

  getData: (token, method, callback) =>
    that = @
    @requestPagedData token, method, (error, result) ->
      if that.outPorts.out.isAttached
        that.outPorts.out.send result
        that.outPorts.out.disconnect
      return callback

  requestPagedData: (token, method, callback) =>
    that = @
    @requestApi token, method, (error, data) ->
      if not data.length
        return callback null, that.results

      that.results = that.results.concat data
      that.params.page++
      that.requestPagedData token, method, callback

  requestApi: (token, method, callback) =>
    that = @
    unless token and typeof token is "string"
      return callback new Error 'A valid token needs to be supplied to IN port.'

    freeagent = new FreeAgent.Api(token, @sandbox)
    freeagent[method] @params, (error, data) ->
      if error
        that.outPorts.out.disconnect()
        return callback error
      return callback if not data
      key = Object.keys(data)[0]
      return callback null, data[key]
