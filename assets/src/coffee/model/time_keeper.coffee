# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class TimeKeeper
  constructor: ->
    @times = 0

  watch: ->
    setTimeout (timeKeeper) ->
      globalObject.canvas.clearCanvas()
      globalObject.player.draw()
      globalObject.player.drawBullets(timeKeeper.times)
      globalObject.player.magazine.logBullets()
      timeKeeper.times++
      timeKeeper.watch()
    , 20, @
