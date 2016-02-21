module.exports = class KeyMotion
  KEY = { 37: 'left', 38: 'up', 39: 'right', 40: 'down' }
  constructor: (code) ->
    @direction = KEY[code]

  pushedArrowKey: ->
    if @direction == undefined then false else true
