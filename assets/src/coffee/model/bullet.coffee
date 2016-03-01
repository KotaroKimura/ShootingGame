# グローバル変数をロード
globalObject = require '../global_object'

# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  constructor: ->
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0
