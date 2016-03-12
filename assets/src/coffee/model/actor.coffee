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

  ### パブリックメソッド群 ###
  move: (direction) ->
    @active_flg[direction] = true

  stop: (direction) ->
    @active_flg[direction] = false

  relocate: (play_width, play_height) ->
    @width  = play_width
    @height = play_height

  moveLeft: (distance) ->
    @distance_width = -distance

  moveRight: (distance) ->
    @distance_width = distance

  moveUp: (distance) ->
    @distance_height = -distance

  moveDwon: (distance) ->
    @distance_height = distance

  resetDistance: ->
    @distance_width  = 0
    @distance_height = 0

  decideBehavior: ->
    _resetDistance.call @
    @calculateDistanceEachActor()
    @width  += @distance_width
    @height += @distance_height

  # override用メソッド
  calculateDistanceEachActor: ->
    true

  # override用メソッド
  draw: (color, radius) ->
    @decideBehavior()
    @drawArc color, radius

  ### プライベートメソッド群 ###
  _resetDistance = ->
    @distance_width  = 0
    @distance_height = 0
