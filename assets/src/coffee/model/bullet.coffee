# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS = 5
  constructor: (play_width, play_height) ->
    @action_flg = false
    super play_width + 10, play_height, 0, 0

  shot: (color, radius) ->
    @action_flg = true
    @draw '#87CEEB', RADIUS
