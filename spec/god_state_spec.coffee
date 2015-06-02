GodState = require "../scripts/god_state"

describe "GodState", ->
  describe "名を唱える", ->
    beforeEach ->
      @state = new GodState

    it "失敗すると「ないわー」", ->
      @state.update("神")
      expect(@state.theWord).toBeNull()

      @state.update("尾")
      expect(@state.theWord).toBeNull()

      @state.update("あ")
      expect(@state.theWord).toEqual(":chi-chan: < ないわー")

    it "最後で失敗すると「マジファックだわー」", ->
      @state.update("神")
      expect(@state.theWord).toBeNull()

      @state.update("尾")
      expect(@state.theWord).toBeNull()

      @state.update("ち")
      expect(@state.theWord).toBeNull()

      @state.update("な")
      expect(@state.theWord).toBeNull()

      @state.update("あ")
      expect(@state.theWord).toEqual(":chi-chan: < マジファックだわー")

    it "成功すると「さいこー」", ->
      @state.update("神")
      expect(@state.theWord).toBeNull()

      @state.update("尾")
      expect(@state.theWord).toBeNull()

      @state.update("ち")
      expect(@state.theWord).toBeNull()

      @state.update("な")
      expect(@state.theWord).toBeNull()

      @state.update("み")
      expect(@state.theWord).toEqual(":chi-chan: < さいこー")

    it "失敗しても許される", ->
      @state.update("神")
      expect(@state.theWord).toBeNull()

      @state.update("尾")
      expect(@state.theWord).toBeNull()

      @state.update("あ")
      expect(@state.theWord).toEqual(":chi-chan: < ないわー")

      @state.update("神")
      expect(@state.theWord).toBeNull()

      @state.update("尾")
      expect(@state.theWord).toBeNull()

      @state.update("ち")
      expect(@state.theWord).toBeNull()

      @state.update("な")
      expect(@state.theWord).toBeNull()

      @state.update("み")
      expect(@state.theWord).toEqual(":chi-chan: < さいこー")
