# グローバル変数
exports = this
exports.globalObject = {
  loop_flg: true
  field   : { width: 980, height: 500 }
  canvas  : $('canvas#field')
}

class Field
  draw: ->
    exports.globalObject['canvas'][0].width = exports.globalObject['field']['width']
    exports.globalObject['canvas'][0].height = exports.globalObject['field']['height']

class Player
  RADIUS   = 10
  DISTANCE = 5
  constructor: ->
    @direction = { left: false, up: false, right: false, down: false }
    @width  = (exports.globalObject['field']['width'] - RADIUS) / 2
    @height = exports.globalObject['field']['height'] - 20

  run: (keyCode) ->
    keyMotion = new KeyMotion(keyCode)
    if keyMotion.pushedArrowKey()
      @direction[keyMotion.code] = true

  stop: (keyCode) ->
    keyMotion = new KeyMotion(keyCode)
    if keyMotion.pushedArrowKey()
      @direction[keyMotion.code] = false

  move: ->
    @clear()
    @judgeBehavior()
    @draw()

  judgeBehavior: ->
    @width -= DISTANCE if @direction['left']
    @width += DISTANCE if @direction['right']
    @height -= DISTANCE if @direction['up']
    @height += DISTANCE if @direction['down']

  draw: ->
    exports.globalObject['canvas'].drawArc(
      {
        fillStyle: '#fff',
        x: @width,
        y: @height,
        radius: RADIUS
      }
    )

  clear: ->
    exports.globalObject['canvas'].clearCanvas()

class KeyMotion
  CODE = { 37: 'left', 38: 'up', 39: 'right', 40: 'down' }
  constructor: (keyCode) ->
    @code = CODE[keyCode]

  pushedArrowKey: ->
    if @code == undefined then false else true

class TimeKeeper
  constructor: ->
    @time = 0

  watch: ->
    if exports.globalObject['loop_flg'] == true
      setTimeout (timeKeeper) ->
        exports.globalObject['player'].move()
        timeKeeper.watch()
      , 1000 / 60, @

$ ->
  new Field().draw()
  exports.globalObject['player'] = new Player()
  exports.globalObject['player'].draw()
  new TimeKeeper().watch()

$(document).on 'keydown', 'body', (e) ->
  exports.globalObject['player'].run e.keyCode

$(document).on 'keyup', 'body', (e) ->
  exports.globalObject['player'].stop e.keyCode
