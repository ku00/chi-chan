GodSpeech = require "../lib/god_speech"

describe "GodSpeech", ->
  describe "ランダムな応答", ->
    beforeEach ->
      @speech = new GodSpeech

    it "'うづら'という単語を含まない", ->
      for i in [1..1000]
        expect(@speech.random()).not.toMatch(/うづら/)
