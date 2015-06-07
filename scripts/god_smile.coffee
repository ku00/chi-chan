module.exports = (robot) ->
  robot.respond /(わら|笑)って/, (msg) ->
    robot.http("https://pass.joe-noh.xyz/api/photos/random")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if res.statusCode isnt 200
          res.send ":chi-chan: ないわー"
          return

        photo = JSON.parse(body)
        msg.send photo.url
