# グローバル変数をロード
globalObject = require '../global'

# 敵の種族情報をロード
Race = require './race'

# 敵の動作情報をロード
Motion = require './motion'

### Enemyクラスのメイン情報オブジェクト ###
# 敵生成に必要な情報を格納したオブジェクト
# オブジェクトの構成は以下の通り
#
# 出現時間:
#   [
#     {
#       race  : 敵の種族情報(race.coffeeを参照)
#       motion: 敵の動作情報
#         type        : 動作パターン(motion.coffeeを参照)
#         turningPoint: 動作パターンに必要になる「起点時間」
#       width : 出現座標の幅
#       height: 出現座標の高さ
#     }
#   ]

module.exports =
  50:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.straight
          turningPoint: undefined
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  100:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.zigzag
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  150:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.upStairs
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  200:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.downStairs
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  250:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.randomStairs
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  300:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.upSlanting
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  350:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.downSlanting
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
  400:
    [
      {
        race  : Race.pawn
        motion:
          type        : Motion.jump
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
