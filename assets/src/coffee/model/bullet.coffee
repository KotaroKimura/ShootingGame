# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS = 5
  constructor: (play_width, play_height) ->
    @active_flg = false
    super play_width + 10, play_height, 0, 0

  shot: ->
    @active_flg = true
    @draw()

  move: ->
    @distance_width = 5
    @draw()

  # override
  draw: ->
    super '#87CEEB', RADIUS
