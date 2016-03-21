# グローバル変数をロード
globalObject = require '../global'

# 敵の種族情報をロード
Race = require './race'

module.exports =
  50:
    [
      {
        race  : Race.pawn
        motion:
          type        : 'straight'
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
          type        : 'zigzag'
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
          type        : 'upStairs'
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
          type        : 'downStairs'
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
          type        : 'randomStairs'
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
          type        : 'upSlanting'
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
          type        : 'downSlanting'
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
          type        : 'jump'
          turningPoint: 15
        width : globalObject.field.width
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
