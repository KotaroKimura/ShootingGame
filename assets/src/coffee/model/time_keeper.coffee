# グローバル変数をロード
globalObject = require '../global_object'

# キャンバスに対して操作を行うモジュールをロード
Canvas = require './concern/canvas'

module.exports = class TimeKeeper
  constructor: (player, enemy) ->
    Canvas::augment @
    @times = 0
    @monitored_object =
      player: player
      enemy:  enemy

  watch: ->
    setTimeout (self) ->
      self.clearField()
      self.monitored_object.enemy.show()
      self.monitored_object.player.show()
      globalObject.magazine.drawBullets self.times, self.monitored_object.player
      self.times++
      self.watch()
    , 15, @
