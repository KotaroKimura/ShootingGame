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
    keyMotion.decidePlayerMotion player, keyMotion.type.down

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.decidePlayerMotion player, keyMotion.type.up

  $(document).on 'keydown', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.decideBulletMotion player, keyMotion.type.down

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.decideBulletMotion player, keyMotion.type.up
