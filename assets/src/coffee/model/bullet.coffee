# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS    = 5
  DIRECTION = 'right'
  DISTANCE  = 15
  constructor: (play_width, play_height) ->
    super play_width + 20, play_height, 0, 0, RADIUS

  hide: ->
    @stop DIRECTION

  # override
  show: ->
    super '#ffa500'

  # override
  calculateDistance: ->
    if @canMoveTo.right then @right DISTANCE else @move DIRECTION
