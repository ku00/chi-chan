GodImage  = require './god_image'
GodRandom = require './god_random'

NAMES = [
  "神木隆之介",
  "佐藤健",
  "三浦春馬"
]

class GodIkemen
  constructor: ->
    @image = new GodImage()

  search: (callback) ->
    @image.search(GodRandom.one(NAMES), callback)

module.exports = GodIkemen
