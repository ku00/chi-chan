request   = require 'request'
GodRandom = require './god_random'

class GodImage
  constructor: ->
    @baseThumbUrl  = "http://tumbapi.herokuapp.com/search/photo"
    @baseGoogleUrl = "https://ajax.googleapis.com/ajax/services/search/images"

  search: (query, callback) ->
    q = v: '1.0', rsz: '8', q: query, safe: 'active', imgType: 'face'

    url = "#{@baseGoogleUrl}?#{@_buildQuery(q)}"
    request url, (err, res, body) =>
      if res.statusCode isnt 200
        callback ":chi-chan: マジファックだわー"
        return
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = GodRandom.one(images)
        callback @_appendPngIfNecessary(image.unescapedUrl)

  search_tumb: (query, callback) ->
    url = "#{@baseThumbUrl}?q=#{encodeURIComponent(query)}"

    request url, (err, res, body) ->
      if res.statusCode isnt 200
        callback ":chi-chan: マジファックだわー"
        return
      urls = JSON.parse(body).urls
      callback(GodRandom.one urls)

  _buildQuery: (params) ->
   ret = []
   for k of params
     ret.push(encodeURIComponent(k) + "=" + encodeURIComponent(params[k]))
   ret.join("&")

  _appendPngIfNecessary: (url) ->
    ext = url.split('.').pop()
    if /(png|jpe?g|gif)/i.test(ext)
      url
    else
      "#{url}#.png"
module.exports = GodImage
