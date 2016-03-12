# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Actor = require './actor'
Bullet = require './bullet'

module.exports = class Player extends Actor
  RADIUS = 10
  # 加速率
  # 「停止」から「最高速」までの振り幅を示す
  ACCELERATION = 0.9
  # 摩擦
  # 摩擦がかかる < 1(摩擦0) < 加速する
  FRICTION = 0.91
  constructor: ->
    @shot_flg   = false
    @active_flg =
      left : false
      up   : false
      right: false
      down : false
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0

  move: (direction) ->
    @active_flg[direction] = true

  stop: (direction) ->
    @active_flg[direction] = false

  shot: ->
    @shot_flg = true

  stopShotting: ->
    @shot_flg = false

  # override
  draw: ->
    super '#fff', RADIUS

  # override
  decideBehavior: ->
    _calculateAcceleration.call @
    _calculateFriction.call @
    super

  drawBullets: (loop_times) ->
    _shotBullet.call @ if _canShotBullet.call @, loop_times
    globalObject.magazine.drawActiveBullets()

  _canShotBullet = (loop_times) ->
    if (@shot_flg is true) and (loop_times % 10 is 0) then true else false # 銃弾を打つ間隔を広くする

  _shotBullet = ->
    reloaded_bullets = globalObject.magazine.getReloadedBullets()
    if reloaded_bullets.length is 0
      _shotNewBullet.call @
    else
      _shotReloadedBullet.call @, reloaded_bullets[0] # 再利用可能なbulletオブジェクトを任意に取得

  _shotNewBullet = ->
    bullet = new Bullet @width, @height
    bullet.shot()
    globalObject.magazine.list.push bullet

  _shotReloadedBullet = (bullet) ->
    bullet.relocate @width, @height
    bullet.shot()

  _calculateAcceleration = ->
    @distance_width -= ACCELERATION if @active_flg.left
    @distance_width += ACCELERATION if @active_flg.right
    @distance_height -= ACCELERATION if @active_flg.up
    @distance_height += ACCELERATION if @active_flg.down

  _calculateFriction = ->
    @distance_width = @distance_width * FRICTION
    @distance_height = @distance_height * FRICTION
