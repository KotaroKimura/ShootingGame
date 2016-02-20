# グローバル変数
exports = this
exports.globalObject = {
  loop_flg: true
  field   : { width: 980, height: 500 }
  canvas  : $('canvas#field')
}

class Field
  @draw: ->
    exports.globalObject.canvas[0].width = exports.globalObject.field.width
    exports.globalObject.canvas[0].height = exports.globalObject.field.height

class Player
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
    @height = (exports.globalObject.field.height - RADIUS) / 2
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
    exports.globalObject.canvas.drawArc(
      {
        fillStyle: '#fff',
        x: @width,
        y: @height,
        radius: RADIUS
      }
    )

  clear: ->
    exports.globalObject.canvas.clearCanvas()

class KeyMotion
  KEY = { 37: 'left', 38: 'up', 39: 'right', 40: 'down' }
  constructor: (code) ->
    @direction = KEY[code]

  pushedArrowKey: ->
    if @direction == undefined then false else true

class TimeKeeper
  constructor: ->
    @time = 0

  watch: ->
    if exports.globalObject.loop_flg == true
      setTimeout (timeKeeper) ->
        exports.globalObject.player.redraw()
        timeKeeper.watch()
      , 15, @

$ ->
  Field.draw()
  exports.globalObject.player = new Player()
  exports.globalObject.player.draw()
  new TimeKeeper().watch()

$(document).on 'keydown', 'body', (e) ->
  keyMotion = new KeyMotion(e.keyCode)
  if keyMotion.pushedArrowKey()
    exports.globalObject.player.move keyMotion.direction

$(document).on 'keyup', 'body', (e) ->
  keyMotion = new KeyMotion(e.keyCode)
  if keyMotion.pushedArrowKey()
    exports.globalObject.player.stop keyMotion.direction
