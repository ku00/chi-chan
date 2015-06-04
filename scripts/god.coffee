# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

GOD_SPEECH = [
  "ファッキンクレイジーだな",
  "アンニュイなかんじ",
  "私はこうやって地位を確立しました",
  "お前そういうとこあるよな",
  "ブス！",
  "ブスの頂点は私です",
  "怒られたい",
  "私これキラーイ",
  "わかるー",
  "でも陰で言うより良くない？",
  "はらたつー",
  "それなーー",
  "ごきげんよう",
  "ごきげんうるわしゅう",
  "ハッピーアイスクリームゥー！ :ok_woman",
  "よいのでは〜",
  "アイスたべたい :icecream: ",
  "☝️",
  "コレクソまずいな",
  "あいつ私に何てモノ食わせてんだよ",
  "イイナァ",
  "惚れちゃう〜",
  "好き！",
  "人間の死亡率は100%だから死を恐れることはないヨ！",
  "神木君さいこう",
  "おめぇ本格的にはらたつな！！！！",
  "ここまで反省の色なし",
  "あーあ\nあーあ\nうづらさんの\n悲しそうなかんじ\nあーあ\nあーあ\nアーアーアーアー\nいけよ\nお前"
]

module.exports = (robot) ->
  count = 0
  fail_word = (cnt) ->
    count = 0
    if cnt > 0 and cnt < 4
      ":chi-chan:<ないわー"
    else if cnt is 4
      ":chi-chan:<マジファックだわー"

  robot.hear /(.*)/i, (msg) ->
    word = msg.match[1]

    res = switch word
      when "神"
        if count is 0
          count++
          null
        else
          fail_word(count)
      when "尾"
        if count is 1
          count++
          null
        else
          fail_word(count)
      when "ち"
        if count is 2
          count++
          null
        else
          fail_word(count)
      when "な"
        if count is 3
          count++
          null
        else
          fail_word(count)
      when "み"
        if count is 4
          count = 0
          ":chi-chan:<さいこー"
        else
          fail_word(count)
      else
        fail_word(count)

    msg.send "#{res}" if res

  robot.hear /:chi-chan|@chi-chan/i, (msg) ->
    msg.send msg.random GOD_SPEECH
  #
  # robot.hear /I like pie/i, (msg) ->
  #   msg.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (msg) ->
  #   msg.send msg.random lulz
  #
  # robot.topic (msg) ->
  #   msg.send "#{msg.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (msg) ->
  #   msg.send msg.random enterReplies
  # robot.leave (msg) ->
  #   msg.send msg.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (msg) ->
  #   unless answer?
  #     msg.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   msg.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (msg) ->
  #   setTimeout () ->
  #     msg.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   msg.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     msg.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, msg) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if msg?
  #     msg.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (msg) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     msg.reply "I'm too fizzy.."
  #
  #   else
  #     msg.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (msg) ->
  #   robot.brain.set 'totalSodas', 0
  #   robot.respond 'zzzzz'
