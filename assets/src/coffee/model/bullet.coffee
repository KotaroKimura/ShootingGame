# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS    = 5
  DIRECTION = 'right'
  DISTANCE  = 15
  HITPOINT  = 1
  constructor: (play_width, play_height) ->
    super play_width + 20, play_height, 0, 0, RADIUS, HITPOINT

  hide: ->
    @stop DIRECTION

  # override
  show: ->
    super '#ffa500'

  # override
  calculateDistance: ->
    if @canMoveTo.right then @right DISTANCE else @move DIRECTION

  # override
  attack: (targetActor) ->
    super targetActor
    @hide() if @isDead()
    targetActor.hide() if targetActor.isDead()

  reuse: (play_width, play_height) ->
    @width    = play_width
    @height   = play_height
    @hitPoint = HITPOINT
