# グローバル変数をロード
globalObject = require '../config/global'

# モデルクラスをロード
Actor = require './actor'

module.exports = class Player extends Actor
  constructor: ->
    @playerInfo = require '../config/player/main' # 実機に関する情報を持ったオブジェクトをロード
    @shootable = false
    super(
      @playerInfo.width,
      @playerInfo.height,
      0,
      0,
      @playerInfo.radius,
      @playerInfo.hitPoint
    )

  ### パブリックメソッド群 ###
  shoot: ->
    @shootable = true

  stopShooting: ->
    @shootable = false

  # override
  show: ->
    super @playerInfo.color

  # override
  calculateDistance: ->
    @left  @playerInfo.distance if _canMoveLeft.call @
    @right @playerInfo.distance if _canMoveRight.call @
    @up    @playerInfo.distance if _canMoveUp.call @
    @down  @playerInfo.distance if _canMoveDown.call @

  ### プライベートメソッド群 ###
  _canMoveLeft = ->
    @canMoveTo.left and @width > @playerInfo.radius + 5

  _canMoveRight = ->
    @canMoveTo.right and @width < globalObject.field.width - (@playerInfo.radius + 5)

  _canMoveUp = ->
    @canMoveTo.up and @height > @playerInfo.radius + 10

  _canMoveDown = ->
    @canMoveTo.down and @height < globalObject.field.height - (@playerInfo.radius + 5)
