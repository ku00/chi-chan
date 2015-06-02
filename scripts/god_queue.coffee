class GodQueue
  constructor: (size) ->
    @max_length = size
    @queue = []

  # push an item
  #
  # q.push("a") #=> ["a"]
  # q.push("b") #=> ["b", a"]
  # q.push("c") #=> ["c", "b", "a"]
  push: (item) ->
    @queue.unshift(item)
    @queue.shift() if @queue.length > @max_length

  matchLatest: (words) ->
    return false if words.length > @queue.length

    words = words.reverse()
    for i in [0 .. words.length-1]
      return false if @queue[i] != words[i]
    return true

module.exports = GodQueue
