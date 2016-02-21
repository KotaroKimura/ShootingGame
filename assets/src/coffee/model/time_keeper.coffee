# グローバル変数をロード
globalObject = require '../global_object.js'

module.exports = class TimeKeeper
  constructor: ->
    @time = 0

  watch: ->
    if globalObject.loop_flg == true
      setTimeout (timeKeeper) ->
        globalObject.player.redraw()
        timeKeeper.watch()
      , 15, @
