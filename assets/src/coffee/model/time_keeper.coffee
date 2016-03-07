# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class TimeKeeper
  watch: ->
    setTimeout (timeKeeper) ->
      globalObject.canvas.clearCanvas()
      globalObject.player.draw()
      globalObject.player.magazine.drawBullets()
      timeKeeper.watch()
    , 15, @
