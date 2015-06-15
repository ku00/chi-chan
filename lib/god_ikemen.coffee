GodImage  = require './god_image'
GodRandom = require './god_random'

NAMES = [
  "三浦春馬"
  "神木隆之介"
  "染谷将太"
  "窪田正孝"
  "dane dahaan"
]

class GodIkemen
  constructor: ->
    @image = new GodImage()

  search: (callback) ->
    @image.search(GodRandom.one(NAMES), callback)

module.exports = GodIkemen
