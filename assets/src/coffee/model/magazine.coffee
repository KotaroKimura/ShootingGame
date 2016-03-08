# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Bullet = require './bullet'

module.exports = class Magazine
  constructor: ->
    @list = []

  drawActiveBullets: ->
    for bullet in @getActiveBullets()
      if globalObject.field.width > bullet.width then bullet.move() else bullet.clear()

  getReloadedBullets: ->
    bullet for bullet in @list when bullet.active_flg isnt true

  getActiveBullets: ->
    bullet for bullet in @list when bullet.active_flg is true

  logBullets: ->
    console.log "弾倉内の銃弾総数は「#{@list.length}」"
    console.log "画面上に表示中の銃弾数は「#{@getActiveBullets().length}」"
    console.log "再利用可能な銃弾数は「#{@getReloadedBullets().length}」"
