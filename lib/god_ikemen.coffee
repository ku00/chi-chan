GodImage = require './god_image'

NAMES = [
  "神木隆之介",
  "佐藤健",
  "三浦春馬"
]

class GodIkemen
  constructor: ->
    @image = new GodImage()

  search: (callback) ->
    index = Math.floor(Math.random() * NAMES.length)
    @image.search(NAMES[index], callback)

module.exports = GodIkemen
