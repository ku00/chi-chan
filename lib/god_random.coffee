class GodRandom
  @one: (array) ->
    index = Math.floor(Math.random() * array.length)
    array[index]

module.exports = GodRandom
