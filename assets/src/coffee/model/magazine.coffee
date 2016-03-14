# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Bullet = require './bullet'

### Magazineクラス ###
# Bulletクラスのオブジェクトを配列として格納し、その操作を行うクラス
# グローバル変数として持たせている(Player, Enemyクラスで共通のBulletオブジェクトを使用するため)

module.exports = class Magazine
  constructor: ->
    @list = []

  ### パブリックメソッド群 ###
  drawBullets: (loop_times, actor) ->
    _drawshotBullet.call @, loop_times, actor
    _drawActiveBullets.call @

  ### プライベートメソッド群 ###
  _drawshotBullet = (loop_times, actor) ->
    width            = actor.width
    height           = actor.height
    reloaded_bullets = _getReloadedBullets.call @
    return unless _canShootBullet.call @, loop_times, actor.shootable

    if reloaded_bullets.length is 0
      _shootNewBullet.call @, width, height
    else
      _shootReloadedBullet.call @, reloaded_bullets[0], width, height

  _drawActiveBullets = ->
    for bullet in _getActiveBullets.call @
      if globalObject.field.width > bullet.width then bullet.show() else bullet.hide()

  _getActiveBullets = ->
    bullet for bullet in @list when bullet.canMoveTo.right

  _getReloadedBullets = ->
    bullet for bullet in @list when not bullet.canMoveTo.right

  _canShootBullet = (loop_times, shootable) ->
    shootable is true and loop_times % 10 is 0

  _shootNewBullet = (width, height) ->
    bullet = new Bullet width, height
    bullet.show()
    @list.push bullet

  _shootReloadedBullet = (bullet, width, height) ->
    bullet.relocate width + 20, height
    bullet.show()
