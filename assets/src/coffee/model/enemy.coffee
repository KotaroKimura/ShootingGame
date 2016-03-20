# グローバル変数をロード
globalObject = require '../config/global'

# 親クラスをロード
Actor = require './actor'

module.exports = class Enemy extends Actor
  RADIUS    = 10
  DISTANCE  = 10
  DIRECTION = 'left'
  constructor: (info_arg) ->
    @setInstance info_arg
    super @width, @height, 0, 0

  setInstance: (info_arg) ->
    @type   = info_arg.type
    @color  = info_arg.color
    @width  = info_arg.width
    @height = info_arg.height

  hide: ->
    @stop DIRECTION

  # override
  show: ->
    super @color, RADIUS

  reShow: (info_arg) ->
    @setInstance info_arg
    @show()

  # override
  calculateDistance: ->
    if @canMoveTo.left then @left DISTANCE else @move DIRECTION
