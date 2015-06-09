tumblr = require 'tumblrbot'

class TumblrLovelive
  getGif: (photo) ->
    tumblr.photos("lovelivegif.tumblr.com").random (post) ->
      photo(post.photos[0].original_size.url)

module.exports = TumblrLovelive
