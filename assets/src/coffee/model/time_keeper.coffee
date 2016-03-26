# グローバル変数をロード
globalObject = require '../config/global'

# キャンバスに対して操作を行うモジュールをロード
Canvas = require './concern/canvas'

module.exports = class TimeKeeper
  constructor: (player, enemyBox) ->
    Canvas::augment @
    @times = 0
    @monitored_object =
      player  : player
      enemyBox: enemyBox

  watch: ->
    setTimeout (timeKeeper) ->
      timeKeeper.clearField() # キャンバスの初期化
      timeKeeper.monitored_object.enemyBox.showEnemies timeKeeper.times # 敵の表示
      timeKeeper.monitored_object.player.show() # 実機の表示
      globalObject.magazine.showBullets timeKeeper.times, timeKeeper.monitored_object.player # 弾の表示
      timeKeeper.monitored_object.enemyBox.attack timeKeeper.monitored_object.player # 実機と敵の当たり判定
      # 敵と弾(実機)の当たり判定
      clearTimeout(times) if timeKeeper.monitored_object.player.isDead() # 実機が死んだらループを止める
      timeKeeper.times++
      timeKeeper.watch()
    , 15, @
