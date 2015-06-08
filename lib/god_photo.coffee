request = require 'request'

class GodPhoto
  constructor: ->
    @url = "https://pass.joe-noh.xyz/api/photos/random"

  random: (callback) ->
    message = ""
    request @url, (err, res, body) =>
      if res.statusCode isnt 200
        callback(":chi-chan: ないわー")
      else
        callback(JSON.parse(body).url)

module.exports = GodPhoto
