# キャンバスに対して操作を行うモジュールをロード
Canvas = require './concern/canvas'

module.exports = class Actor
  constructor: (@width, @height, @distance_width, @distance_height) ->
    Canvas::augment @
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

  resetDistance: ->
    @distance_width  = 0
    @distance_height = 0

  decideBehavior: ->
    @width += @distance_width
    @height += @distance_height

  draw: (color, radius) ->
    @decideBehavior()
    @drawArc color, radius
