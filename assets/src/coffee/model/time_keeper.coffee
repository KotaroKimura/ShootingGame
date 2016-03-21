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
      timeKeeper.clearField()
      timeKeeper.monitored_object.enemyBox.showEnemies timeKeeper.times
      timeKeeper.monitored_object.player.show()
      globalObject.magazine.showBullets timeKeeper.times, timeKeeper.monitored_object.player
      timeKeeper.times++
      timeKeeper.watch()
    , 15, @
