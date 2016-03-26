# 親クラスをロード
Actor = require './actor'

# 自身の動きを操作するためのモジュールをロード
Motion = require './concern/enemy_motion'

module.exports = class Enemy extends Actor
  constructor: (info_arg) ->
    _setInstance.call @, info_arg
    Motion::augment @
    super info_arg.width, info_arg.height, 0, 0, info_arg.race.radius

  ### パブリックメソッド群 ###
  die: ->
    for direction in ['left', 'top', 'down']
      @stop direction

  # override
  show: ->
    super @color
    @times++

  reShow: (info_arg) ->
    _setInstance.call @, info_arg
    @show()

  # override
  calculateDistance: ->
    @[@motionType]()
    @left @distance if @canMoveTo.left
    @up   @distance if @canMoveTo.up
    @down @distance if @canMoveTo.down

  ### プライベートメソッド群 ###
  _setInstance = (info_arg) ->
    @width        = info_arg.width
    @height       = info_arg.height
    @times        = 0
    @motionType   = info_arg.motion.type
    @turningPoint = info_arg.motion.turningPoint
    @distance     = info_arg.race.distance
    @type         = info_arg.race.type
    @color        = info_arg.race.color
    @radius       = info_arg.race.radius
