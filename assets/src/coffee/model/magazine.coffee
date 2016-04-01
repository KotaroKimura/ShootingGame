# グローバル変数をロード
globalObject = require '../config/global'

# モデルクラスをロード
Bullet = require './bullet'

### Magazineクラス ###
# Bulletクラスのオブジェクトを配列として格納し、その操作を行うクラス
# グローバル変数として持たせている(Player, Enemyクラスで共通のBulletオブジェクトを使用するため)

module.exports = class Magazine
  constructor: ->
    @list = []

  ### パブリックメソッド群 ###
  attack: (enemies) ->
    for bullet in _getAliveBullets.call @
      for enemy in enemies.getAliveEnemies()
        bullet.attack enemy

  showBullets: (loopTimes, actor) ->
    _drawshotBullet.call @, loopTimes, actor
    _drawActiveBullets.call @

  ### プライベートメソッド群 ###
  _drawshotBullet = (loopTimes, actor) ->
    reloaded_bullets = _getReloadedBullets.call @
    return unless _canShootBullet.call @, loopTimes, actor.shootable

    if reloaded_bullets.length is 0
      _shootNewBullet.call @, actor
    else
      _shootReloadedBullet.call @, reloaded_bullets[0], actor

  _drawActiveBullets = ->
    for bullet in _getActiveBullets.call @
      if globalObject.field.width > bullet.width then bullet.show() else bullet.hide()

  _getActiveBullets = ->
    (bullet for bullet in @list when bullet.isActive())

  _getReloadedBullets = ->
    (bullet for bullet in @list when not bullet.isActive())

  _canShootBullet = (loopTimes, shootable) ->
    shootable is true and loopTimes % 3 is 0

  _shootNewBullet = (actor) ->
    bullet = new Bullet actor
    bullet.show()
    @list.push bullet

  _shootReloadedBullet = (bullet, actor) ->
    bullet.reuse actor
    bullet.show()

  _getAliveBullets = ->
    (bullet for bullet in @list when bullet.isAlive())
