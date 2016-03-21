# 親クラスをロード
Actor = require './actor'

# 自身の動きを操作するためのモジュールをロード
Motion = require './concern/enemy_motion'

module.exports = class Enemy extends Actor
  constructor: (info_arg) ->
    _setInstance.call @, info_arg
    Motion::augment @
    super @width, @height, 0, 0

  ### パブリックメソッド群 ###
  die: ->
    for direction in ['left', 'top', 'down']
      @stop direction

  # override
  show: ->
    super @color, @radius
    @times++

  reShow: (info_arg) ->
    _setInstance.call @, info_arg
    @show()

  # override
  calculateDistance: ->
    eval "this.#{@motionType}()"
    @left @distance if @canMoveTo.left
    @up   @distance if @canMoveTo.up
    @down @distance if @canMoveTo.down

  ### プライベートメソッド群 ###
  _setInstance = (info_arg) ->
    @times        = 0
    @radius       = info_arg.race.radius
    @motionType   = info_arg.motion.type
    @turningPoint = info_arg.motion.turningPoint
    @distance     = info_arg.race.distance
    @type         = info_arg.race.type
    @color        = info_arg.race.color
    @width        = info_arg.width
    @height       = info_arg.height
