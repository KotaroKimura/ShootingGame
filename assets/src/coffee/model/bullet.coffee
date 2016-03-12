# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS    = 5
  DIRECTION = 'right'
  DISTANCE  = 15
  constructor: (play_width, play_height) ->
    super play_width + 20, play_height, 0, 0

  clear: ->
    @stop(DIRECTION)

  # override
  draw: ->
    super '#87CEEB', RADIUS

  # override
  calculateDistanceEachActor: ->
    if @active_flg.right is true then @moveRight DISTANCE else @move(DIRECTION)
