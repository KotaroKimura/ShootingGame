# Mixinに必要なクラスを定義(http://goo.gl/ai6WpG)
class Mixin
  augment: (t) ->
    (t[n] = m unless n == 'augment' or !this[n].prototype?) for n, m of this

module.exports = class Canvas extends Mixin
  CANVAS = $('canvas#field')

  clear: ->
    CANVAS.clearCanvas()

  drawField: (width, height) ->
    CANVAS[0].width = width
    CANVAS[0].height = height

  drawArc: (color, radius) ->
    CANVAS.drawArc(
      {
        fillStyle: color,
        x: @width,
        y: @height,
        radius: radius
      }
    )
