# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS = 5
  constructor: (play_width, play_height) ->
    @active_flg = false
    super play_width + 10, play_height, 0, 0

  init: ->
    @width      = 0
    @height     = 0
    @active_flg = false

  shot: ->
    @active_flg = true
    @draw()

  move: ->
    @distance_width = 5
    @draw()

  # override
  draw: ->
    super '#87CEEB', RADIUS
