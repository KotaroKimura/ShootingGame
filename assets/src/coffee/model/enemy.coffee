# グローバル変数をロード
globalObject = require '../global_object'

# 親クラスをロード
Actor = require './actor'

module.exports = class Enemy extends Actor
  RADIUS   = 10
  DISTANCE = 10
  constructor: ->
    super(
      globalObject.field.width - RADIUS,
      (globalObject.field.height - RADIUS) / 2,
      0,
      0
    )

  # override
  show: ->
    super '#ff0000', RADIUS

  # override
  calculateDistance: ->
    @left DISTANCE
