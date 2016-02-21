# グローバル変数をロード
globalObject = require '../global_object.js'

module.exports = class Player
  RADIUS = 10
  # 加速率
  # 「停止」から「最高速」までの振り幅を示す
  ACCELERATION = 0.4
  # 摩擦
  # 摩擦がかかる < 1(摩擦0) < 加速する
  FRICTION = 0.91
  constructor: ->
    @action_flg = { left: false, up: false, right: false, down: false }
    @width  = 20
    @height = (globalObject.field.height - RADIUS) / 2
    @distance_width = 0
    @distance_height = 0

  move: (direction) ->
    @action_flg[direction] = true

  stop: (direction) ->
    @action_flg[direction] = false

  redraw: ->
    @clear()
    @decideBehavior()
    @draw()

  calculateAcceleration: ->
    @distance_width -= ACCELERATION if @action_flg.left
    @distance_width += ACCELERATION if @action_flg.right
    @distance_height -= ACCELERATION if @action_flg.up
    @distance_height += ACCELERATION if @action_flg.down

  calculateFriction: ->
    @distance_width = @distance_width * FRICTION
    @distance_height = @distance_height * FRICTION

  decideBehavior: ->
    @calculateAcceleration()
    @calculateFriction()
    @width += @distance_width
    @height += @distance_height

  draw: ->
    globalObject.canvas.drawArc(
      {
        fillStyle: '#fff',
        x: @width,
        y: @height,
        radius: RADIUS
      }
    )

  clear: ->
    globalObject.canvas.clearCanvas()
