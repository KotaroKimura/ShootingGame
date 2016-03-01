# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class Actor
  constructor: (@width, @height, @distance_width, @distance_height) ->

  draw: (color, radius) ->
    _clear.call @
    @decideBehavior()
    _drawArc.call @, color, radius

  decideBehavior: ->
    @width += @distance_width
    @height += @distance_height

  _drawArc = (color, radius) ->
    globalObject.canvas.drawArc(
      {
        fillStyle: color,
        x: @width,
        y: @height,
        radius: radius
      }
    )

  _clear = ->
    globalObject.canvas.clearCanvas()
