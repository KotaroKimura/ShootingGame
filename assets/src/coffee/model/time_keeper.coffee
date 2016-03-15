# グローバル変数をロード
globalObject = require './config/global'

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
    setTimeout (self) ->
      self.clearField()
      self.monitored_object.enemyBox.showEnemies self.times
      self.monitored_object.player.show()
      globalObject.magazine.showBullets self.times, self.monitored_object.player
      self.times++
      self.watch()
    , 15, @
