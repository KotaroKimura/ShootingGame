# グローバル変数をロード
globalObject = require '../config/global'

# 敵の種族情報をロード
Race = require '../config/enemy/race'

# 敵の動作情報をロード
Motion = require '../config/enemy/motion'

### EnemyGeneratorクラス ###
# Enemyクラスのオブジェクト生成に必要なデータを、動的に作成するクラス

module.exports = class EnemyGenerator
  constructor: (@appearance_rate) ->

  ### パブリックメソッド群 ###
  generateEenemy: ->
    return [] if @appearance_rate < Math.round Math.random() * 100
    [
      race  : Race.pawn
      motion:
        type        : Motion.straight
        turningPoint: undefined
      width : globalObject.field.width
      height: (globalObject.field.height - Race.pawn.radius) / 2
    ]

  ### プライベートメソッド群 ###
