# グローバル変数をロード
globalObject = require './global_object.js'

# モデルクラスをロード
Field = require './model/field.js'
Player = require './model/player.js'
KeyMotion = require './model/key_motion.js'
TimeKeeper = require './model/time_keeper.js'

$ ->
  Field.draw()
  globalObject.player = new Player()
  globalObject.player.draw()
  new TimeKeeper().watch()

$(document).on 'keydown', 'body', (e) ->
  keyMotion = new KeyMotion(e.keyCode)
  if keyMotion.pushedArrowKey()
    globalObject.player.move keyMotion.direction

$(document).on 'keyup', 'body', (e) ->
  keyMotion = new KeyMotion(e.keyCode)
  if keyMotion.pushedArrowKey()
    globalObject.player.stop keyMotion.direction
