# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class TimeKeeper
  constructor: (player) ->
    @times  = 0
    @monitored_object =
      player: player

  watch: ->
    setTimeout (self) ->
      globalObject.canvas.clearCanvas()
      self.monitored_object.player.draw()
      self.monitored_object.player.drawBullets(self.times)
      self.times++
      self.watch()
    , 15, @
