# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS    = 5
  DIRECTION = 'right'
  DISTANCE  = 15
  constructor: (play_width, play_height) ->
    super play_width + 20, play_height, 0, 0

  hide: ->
    @stop DIRECTION

  # override
  show: ->
    super '#87CEEB', RADIUS

  # override
  calculateDistance: ->
    console.log @canMoveTo
    if @canMoveTo.right then @right DISTANCE else @move DIRECTION
