request   = require 'request'
GodRandom = require './god_random'

class GodImage
  constructor: ->
    @baseUrl = "http://tumbapi.herokuapp.com/search/photo"

  search: (query, callback) ->
    url = "#{@baseUrl}?q=#{encodeURIComponent(query)}"

    request url, (err, res, body) ->
      if res.statusCode isnt 200
        callback ":chi-chan: マジファックだわー"
        return
      urls = JSON.parse(body).urls
      callback(GodRandom.one urls)

module.exports = GodImage
