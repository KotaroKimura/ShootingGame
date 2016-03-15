# グローバル変数をロード
globalObject = require './config/global'

# モデルクラスをロード
Enemy = require './enemy'

### EnemyBoxクラス ###
# Enemyクラスのオブジェクトを配列として格納し、その操作を行うクラス

module.exports = class EnemyBox
  constructor: ->
    @box = []

  ### パブリックメソッド群 ###
  showEnemies: (loopTimes) ->
    console.log loopTimes

  ### プライベートメソッド群 ###
