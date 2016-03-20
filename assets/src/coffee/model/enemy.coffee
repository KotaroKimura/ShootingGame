# グローバル変数をロード
globalObject = require '../config/global'

# 親クラスをロード
Actor = require './actor'

module.exports = class Enemy extends Actor
  DIRECTION = 'left'
  constructor: (info_arg) ->
    _setInstance.call @, info_arg
    super @width, @height, 0, 0

  ### パブリックメソッド群 ###
  hide: ->
    @stop DIRECTION

  # override
  show: ->
    super @color, @radius

  reShow: (info_arg) ->
    _setInstance.call @, info_arg
    @show()

  # override
  calculateDistance: ->
    if @canMoveTo.left then @left @distance else @move DIRECTION

  ### プライベートメソッド群 ###
  _setInstance = (info_arg) ->
    console.log info_arg
    @radius   = info_arg.race.radius
    @distance = info_arg.race.distance
    @type     = info_arg.race.type
    @color    = info_arg.race.color
    @width    = info_arg.width
    @height   = info_arg.height
