module.exports = class KeyMotion
  ARROW_KEY = { 37: 'left', 38: 'up', 39: 'right', 40: 'down' }
  constructor: (@code) ->
    @direction = ARROW_KEY[@code]

  pushedArrowKey: ->
    if @direction == undefined then false else true

  pushedSpaceKey: ->
    if @code == 32 then true else false
