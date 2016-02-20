# グローバル変数
exports = this
exports.globalObject = {
  field : { width: 980, height: 500 }
  canvas: $('canvas#field')
}

class Field
  draw: ->
    exports.globalObject['canvas'][0].width = exports.globalObject['field']['width']
    exports.globalObject['canvas'][0].height = exports.globalObject['field']['height']

class Player
  constructor: ->
    @radius = 10
    @width  = (exports.globalObject['field']['width'] - @radius) / 2
    @height = exports.globalObject['field']['height'] - 20

  draw: ->
    exports.globalObject['canvas'].drawArc(
      {
        fillStyle: '#fff',
        x: @width,
        y: @height,
        radius: @radius
      }
    )

  clear: ->
    exports.globalObject['canvas'].clearCanvas()

class Movement
  DISTANCE = 5
  KEYDOWN = { left: 37, up: 38, right: 39, down: 40 }
  constructor: (@keyCode) ->

  doMove: ->
    if _pushedArrowKey.call @
      _controlMovingDistance.call @
      exports.globalObject['player'].clear()
      exports.globalObject['player'].draw()

  _controlMovingDistance = ->
    switch @keyCode
      when KEYDOWN['left']
        exports.globalObject['player'].width -= DISTANCE
      when KEYDOWN['up']
        exports.globalObject['player'].height -= DISTANCE
      when KEYDOWN['right']
        exports.globalObject['player'].width += DISTANCE
      when KEYDOWN['down']
        exports.globalObject['player'].height += DISTANCE

  _pushedArrowKey = ->
    unless $.inArray(
      @keyCode, [KEYDOWN['left'], KEYDOWN['up'], KEYDOWN['right'], KEYDOWN['down']]
    ) == -1 then true else false

do ->
  new Field().draw()
  exports.globalObject['player'] = new Player()
  exports.globalObject['player'].draw()

$(document).on 'keydown', 'body', (e) ->
  new Movement(e.keyCode).doMove()
