# グローバル変数をロード
globalObject = require './model/config/global'

# モデルクラスをロード
Field      = require './model/field'
Player     = require './model/player'
Magazine   = require './model/magazine'
EnemyBox   = require './model/enemy_box'
KeyMotion  = require './model/key_motion'
TimeKeeper = require './model/time_keeper'

do ->
  globalObject.magazine = new Magazine()

$ ->
  new Field().draw()
  player = new Player()
  player.show()
  new TimeKeeper(player, new EnemyBox()).watch()

  $(document).on 'keydown', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.requestTo player, keyMotion.type.down

  $(document).on 'keyup', 'body', (e) ->
    keyMotion = new KeyMotion e.keyCode
    keyMotion.requestTo player, keyMotion.type.up
