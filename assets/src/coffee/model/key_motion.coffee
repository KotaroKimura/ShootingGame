module.exports = class KeyMotion
  SPACE_KEY = 32
  ARROW_KEY =
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'
  constructor: (@code) ->
    @direction = ARROW_KEY[@code]

  pushedArrowKey: ->
    if @direction is undefined then false else true

  pushedSpaceKey: ->
    if @code is SPACE_KEY then true else false
