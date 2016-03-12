module.exports = class KeyMotion
  SPACE_KEY = 32
  ARROW_KEY =
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'
  constructor: (@code) ->
    @type =
      up: 'keyup'
      down: 'keydown'
    @direction = ARROW_KEY[@code]

  ### パブリックメソッド群 ###
  requestToPlayer: (player, key_event) ->
    _decidePlayerMotion.call @, player, key_event
    _decideShottingMotion.call @, player, key_event

  ### プライベートメソッド群 ###
  _decidePlayerMotion = (player, key_event) ->
    return unless _pushedArrowKey.call @
    return player.stop(@direction) if key_event is @type.up
    player.move(@direction) if key_event is @type.down

  _decideShottingMotion = (player, key_event) ->
    return unless _pushedSpaceKey.call @
    return player.stopShotting() if key_event is @type.up
    player.shot() if key_event is @type.down

  _pushedArrowKey = ->
    if @direction is undefined then false else true

  _pushedSpaceKey = ->
    if @code is SPACE_KEY then true else false
