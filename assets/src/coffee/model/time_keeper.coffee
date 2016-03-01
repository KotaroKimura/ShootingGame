# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class TimeKeeper
  constructor: ->
    @time = 0

  watch: ->
    if globalObject.loop_flg is true
      setTimeout (timeKeeper) ->
        globalObject.player.draw()
        timeKeeper.watch()
      , 15, @
