# グローバル変数をロード
globalObject = require '../config/global'

# モデルクラスをロード
Actor = require './actor'

# 実機に関する情報を持ったオブジェクトをロード
PlayerInfo = require '../config/player/main'

module.exports = class Player extends Actor
  constructor: ->
    @shootable = false
    super(
      PlayerInfo.width,
      PlayerInfo.height,
      0,
      0,
      PlayerInfo.radius,
      PlayerInfo.hitPoint
    )

  ### パブリックメソッド群 ###
  shoot: ->
    @shootable = true

  stopShooting: ->
    @shootable = false

  # override
  show: ->
    super PlayerInfo.color

  # override
  calculateDistance: ->
    @left  PlayerInfo.distance if _canMoveLeft.call @
    @right PlayerInfo.distance if _canMoveRight.call @
    @up    PlayerInfo.distance if _canMoveUp.call @
    @down  PlayerInfo.distance if _canMoveDown.call @

  ### プライベートメソッド群 ###
  _canMoveLeft = ->
    @canMoveTo.left and @width > PlayerInfo.radius + 5

  _canMoveRight = ->
    @canMoveTo.right and @width < globalObject.field.width - (PlayerInfo.radius + 5)

  _canMoveUp = ->
    @canMoveTo.up and @height > PlayerInfo.radius + 10

  _canMoveDown = ->
    @canMoveTo.down and @height < globalObject.field.height - (PlayerInfo.radius + 5)
