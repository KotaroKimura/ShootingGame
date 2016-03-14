# グローバル変数をロード
globalObject = require './global_object'

# モデルクラスをロード
Field      = require './model/field'
Enemy      = require './model/enemy'
Player     = require './model/player'
Magazine   = require './model/magazine'
KeyMotion  = require './model/key_motion'
TimeKeeper = require './model/time_keeper'

do ->
  globalObject.magazine = new Magazine()

$ ->
  new Field().draw()
  enemy  = new Enemy()
  enemy.show()
  player = new Player()
  player.show()
  new TimeKeeper(player, enemy).watch()

  $(document).on 'keydown', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.requestTo player, keyMotion.type.down

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.requestTo player, keyMotion.type.up
