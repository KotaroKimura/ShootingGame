# グローバル変数をロード
globalObject = require './config/global'

# 親クラスをロード
Actor = require './actor'

module.exports = class Enemy extends Actor
  RADIUS    = 10
  DISTANCE  = 10
  DIRECTION = 'left'
  constructor: (@height) ->
    super(
      globalObject.field.width - RADIUS,
      @height / 2,
      0,
      0
    )

  # override
  show: ->
    super '#ff0000', RADIUS

  # override
  calculateDistance: ->
    @left DISTANCE
