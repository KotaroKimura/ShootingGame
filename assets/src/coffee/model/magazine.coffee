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
    _drawshotedBullet.call @, loop_times, actor
    _drawActiveBullets.call @

  ### プライベートメソッド群 ###
  _drawshotedBullet = (loop_times, actor) ->
    width            = actor.width
    height           = actor.height
    reloaded_bullets = _getReloadedBullets.call @
    return unless _canShotBullet.call @, loop_times, actor.shot_flg

    if reloaded_bullets.length is 0
      _shotNewBullet.call @, width, height
    else
      _shotReloadedBullet.call @, reloaded_bullets[0], width, height

  _drawActiveBullets = ->
    for bullet in _getActiveBullets.call @
      if globalObject.field.width > bullet.width then bullet.draw() else bullet.clear()

  _getActiveBullets = ->
    bullet for bullet in @list when bullet.active_flg.right is true

  _getReloadedBullets = ->
    bullet for bullet in @list when bullet.active_flg.right isnt true

  _canShotBullet = (loop_times, shot_flg) ->
    if (shot_flg is true) and (loop_times % 10 is 0) then true else false

  _shotNewBullet = (width, height) ->
    bullet = new Bullet width, height
    bullet.draw()
    @list.push bullet

  _shotReloadedBullet = (bullet, width, height) ->
    bullet.relocate width, height
    bullet.draw()
