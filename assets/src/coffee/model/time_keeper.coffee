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
      globalObject.magazine.drawBullets self.times, self.monitored_object.player
      self.times++
      self.watch()
    , 15, @
