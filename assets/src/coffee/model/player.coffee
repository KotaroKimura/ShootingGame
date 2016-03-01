# グローバル変数をロード
globalObject = require '../global_object'

# 親クラスをロード
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
    @action_flg = { left: false, up: false, right: false, down: false }
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0

  move: (direction) ->
    @action_flg[direction] = true

  stop: (direction) ->
    @action_flg[direction] = false

  redraw: ->
    _clear.call @
    @decideBehavior()
    @draw()

  decideBehavior: ->
    _calculateAcceleration.call @
    _calculateFriction.call @
    super

  draw: ->
    globalObject.canvas.drawArc(
      {
        fillStyle: '#fff',
        x: @width,
        y: @height,
        radius: RADIUS
      }
    )

  _calculateAcceleration = ->
    @distance_width -= ACCELERATION if @action_flg.left
    @distance_width += ACCELERATION if @action_flg.right
    @distance_height -= ACCELERATION if @action_flg.up
    @distance_height += ACCELERATION if @action_flg.down

  _calculateFriction = ->
    @distance_width = @distance_width * FRICTION
    @distance_height = @distance_height * FRICTION

  _clear = ->
    globalObject.canvas.clearCanvas()
