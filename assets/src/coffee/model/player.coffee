# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Actor = require './actor'
Bullet = require './bullet'

module.exports = class Player extends Actor
  RADIUS = 10
  # 加速率
  # 「停止」から「最高速」までの振り幅を示す
  ACCELERATION = 0.9
  # 摩擦
  # 摩擦がかかる < 1(摩擦0) < 加速する
  FRICTION = 0.91
  constructor: ->
    @magazines  = [] # Bulletクラスのオブジェクトを格納するインスタンス変数
    @action_flg = { left: false, up: false, right: false, down: false }
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0

  move: (direction) ->
    @action_flg[direction] = true

  stop: (direction) ->
    @action_flg[direction] = false

  shotBullet: ->
    bullet = new Bullet(@width, @height)
    bullet.shot()
    @magazines.push(bullet)

  # override
  draw: ->
    super '#fff', RADIUS

  # override
  decideBehavior: ->
    _calculateAcceleration.call @
    _calculateFriction.call @
    super

  _calculateAcceleration = ->
    @distance_width -= ACCELERATION if @action_flg.left
    @distance_width += ACCELERATION if @action_flg.right
    @distance_height -= ACCELERATION if @action_flg.up
    @distance_height += ACCELERATION if @action_flg.down

  _calculateFriction = ->
    @distance_width = @distance_width * FRICTION
    @distance_height = @distance_height * FRICTION
