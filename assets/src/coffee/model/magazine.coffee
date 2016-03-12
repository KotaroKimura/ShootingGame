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
