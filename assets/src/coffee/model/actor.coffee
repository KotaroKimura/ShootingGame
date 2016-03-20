# キャンバスに対して操作を行うモジュールをロード
Canvas = require './concern/canvas'

module.exports = class Actor
  constructor: (@width, @height, @distance_width, @distance_height) ->
    Canvas::augment @
    @canMoveTo =
      left : false
      up   : false
      right: false
      down : false

  ### パブリックメソッド群 ###
  move: (direction) ->
    @canMoveTo[direction] = true

  stop: (direction) ->
    @canMoveTo[direction] = false

  relocate: (play_width, play_height) ->
    @width  = play_width
    @height = play_height

  left: (distance) ->
    @distance_width = -distance

  right: (distance) ->
    @distance_width = distance

  up: (distance) ->
    @distance_height = -distance

  down: (distance) ->
    @distance_height = distance

  resetDistance: ->
    @distance_width  = 0
    @distance_height = 0

  decideBehavior: ->
    _resetDistance.call @
    @calculateDistance()
    @width  += @distance_width
    @height += @distance_height

  # override用メソッド
  calculateDistance: ->
    true

  # override用メソッド
  show: (color, radius) ->
    @decideBehavior()
    @drawArc color, radius

  isActive: ->
    if (state for direction, state of @canMoveTo when state is true).length is 0 then false else true

  ### プライベートメソッド群 ###
  _resetDistance = ->
    @distance_width  = 0
    @distance_height = 0
