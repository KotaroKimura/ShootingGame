# グローバル変数をロード
globalObject = require '../config/global'

# モデルクラスをロード
Actor = require './actor'

module.exports = class Player extends Actor
  RADIUS   = 15
  DISTANCE = 10
  constructor: ->
    @shootable = false
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0, RADIUS

  ### パブリックメソッド群 ###
  shoot: ->
    @shootable = true

  stopShooting: ->
    @shootable = false

  # override
  show: ->
    super '#ffa500'

  # override
  calculateDistance: ->
    @left  DISTANCE if _canMoveLeft.call @
    @right DISTANCE if _canMoveRight.call @
    @up    DISTANCE if _canMoveUp.call @
    @down  DISTANCE if _canMoveDown.call @

  ### プライベートメソッド群 ###
  _canMoveLeft = ->
    @canMoveTo.left and @width > RADIUS

  _canMoveRight = ->
    @canMoveTo.right and @width < globalObject.field.width - RADIUS

  _canMoveUp = ->
    @canMoveTo.up and @height > RADIUS

  _canMoveDown = ->
    @canMoveTo.down and @height < globalObject.field.height - RADIUS
