# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Actor = require './actor'

module.exports = class Player extends Actor
  RADIUS = 10
  # 加速率
  # 「停止」から「最高速」までの振り幅を示す
  ACCELERATION = 0.9
  # 摩擦
  # 摩擦がかかる < 1(摩擦0) < 加速する
  FRICTION = 0.91
  constructor: ->
    @shot_flg = false
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0

  ### パブリックメソッド群 ###
  shot: ->
    @shot_flg = true

  stopShotting: ->
    @shot_flg = false

  # override
  draw: ->
    super '#fff', RADIUS

  # override
  decideBehavior: ->
    _calculateAcceleration.call @
    _calculateFriction.call @
    super

  ### プライベートメソッド群 ###
  _calculateAcceleration = ->
    @distance_width -= ACCELERATION if @active_flg.left
    @distance_width += ACCELERATION if @active_flg.right
    @distance_height -= ACCELERATION if @active_flg.up
    @distance_height += ACCELERATION if @active_flg.down

  _calculateFriction = ->
    @distance_width = @distance_width * FRICTION
    @distance_height = @distance_height * FRICTION
