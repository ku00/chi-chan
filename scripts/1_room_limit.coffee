module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    if msg.envelope.room in ['general']
      msg.finish()
