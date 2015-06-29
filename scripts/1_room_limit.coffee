# Description:
#   Prevents The God to say something in general channel

module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    if msg.envelope.room in ['please-read']
      msg.finish()
