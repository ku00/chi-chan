request = require 'request'

class GodPhoto
  constructor: ->
    @url = "https://pass.joe-noh.xyz/api/photos/random"

  random: (callback) ->
    @_request @url, callback

  ryoma: (callback) ->
    @_request "#{@url}?subject=ryoma", callback

  _request: (url, callback) ->
    request url, (err, res, body) =>
      if res.statusCode isnt 200
        callback(":chi-chan: ないわー")
      else
        callback(JSON.parse(body).url)

module.exports = GodPhoto
