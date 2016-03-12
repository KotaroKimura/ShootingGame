# グローバル変数をロード
globalObject = require './global_object'

# モデルクラスをロード
Field = require './model/field'
Player = require './model/player'
KeyMotion = require './model/key_motion'
TimeKeeper = require './model/time_keeper'

$ ->
  Field.draw()
  player = new Player()
  player.draw()
  new TimeKeeper(player).watch()

  $(document).on 'keydown', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    if keyMotion.pushedArrowKey()
      player.move keyMotion.direction

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    if keyMotion.pushedArrowKey()
      player.stop keyMotion.direction

  $(document).on 'keydown', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    if keyMotion.pushedSpaceKey()
      player.shot()

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    if keyMotion.pushedSpaceKey()
      player.stopShotting()
