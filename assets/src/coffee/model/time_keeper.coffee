# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class TimeKeeper
  constructor: (@player) ->
    @times = 0

  watch: ->
    setTimeout (timeKeeper) ->
      globalObject.canvas.clearCanvas()
      timeKeeper.player.draw()
      timeKeeper.player.drawBullets(timeKeeper.times)
      timeKeeper.times++
      timeKeeper.watch()
    , 15, @
