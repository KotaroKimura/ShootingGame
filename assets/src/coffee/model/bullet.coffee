# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  RADIUS   = 5
  DISTANCE = 'right'
  constructor: (play_width, play_height) ->
    super play_width + 15, play_height, 0, 0

  clear: ->
    @stop(DISTANCE)

  # override
  draw: ->
    super '#87CEEB', RADIUS

  # override
  decideBehavior: ->
    # 画面に表示されていれば、X座標をプラス15。
    # 画面に表示されていなければ、表示。
    if @active_flg.right is true then @distance_width = 15 else @move(DISTANCE)
    super
