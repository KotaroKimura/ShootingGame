# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class Actor
  constructor: (@width, @height, @distance_width, @distance_height) ->
    @active_flg =
      left : false
      up   : false
      right: false
      down : false

  move: (direction) ->
    @active_flg[direction] = true

  stop: (direction) ->
    @active_flg[direction] = false

  relocate: (play_width, play_height) ->
    @width  = play_width
    @height = play_height

  decideBehavior: ->
    @width += @distance_width
    @height += @distance_height

  draw: (color, radius) ->
    @decideBehavior()
    _drawArc.call @, color, radius

  _drawArc = (color, radius) ->
    globalObject.canvas.drawArc(
      {
        fillStyle: color,
        x: @width,
        y: @height,
        radius: radius
      }
    )
