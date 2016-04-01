# グローバル変数をロード
globalObject = require '../config/global'

# モデルクラスをロード
Actor = require './actor'

module.exports = class Player extends Actor
  constructor: ->
    @details       = require '../config/player/main' # 実機に関する情報を持ったオブジェクトをロード
    @bulletDetails = @details.bullets
    @shootable     = false
    super(
      @details.width,
      @details.height,
      0,
      0,
      @details.radius,
      @details.hitPoint
    )

  ### パブリックメソッド群 ###
  shoot: ->
    @shootable = true

  stopShooting: ->
    @shootable = false

  # override
  show: ->
    super @details.color

  # override
  calculateDistance: ->
    @left  @details.distance if _canMoveLeft.call @
    @right @details.distance if _canMoveRight.call @
    @up    @details.distance if _canMoveUp.call @
    @down  @details.distance if _canMoveDown.call @

  ### プライベートメソッド群 ###
  _canMoveLeft = ->
    @canMoveTo.left and @width > @details.radius + 5

  _canMoveRight = ->
    @canMoveTo.right and @width < globalObject.field.width - (@details.radius + 5)

  _canMoveUp = ->
    @canMoveTo.up and @height > @details.radius + 10

  _canMoveDown = ->
    @canMoveTo.down and @height < globalObject.field.height - (@details.radius + 5)
