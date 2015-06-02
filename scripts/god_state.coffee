class GodState
  constructor: ->
    @callingName = {progress: 0, expectedChars: ["神", "尾", "ち", "な", "み"]}
    @theWord = null

  update: (input) ->
    @theWord = null

    index = @callingName.progress
    if input == @callingName.expectedChars[index]
      @callingName.progress++
      if @callingName.progress == 5
        @callingName.progress = 0
        @theWord = ":chi-chan: < さいこー"
    else
      @callingName.progress = 0

      if 0 < index and index < 4
        @theWord = ":chi-chan: < ないわー"
      else if index == 4
        @theWord = ":chi-chan: < マジファックだわー"

module.exports = GodState
