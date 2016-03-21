# グローバル変数をロード
globalObject = require '../global'

# 敵の種族情報をロード
Race = require './race'

module.exports =
  100:
    [
      {
        race  : Race.pawn
        motion:
          type  : 'straight'
          stroke: undefined
        width : 1000
        height: (globalObject.field.height - Race.pawn.radius) / 2
      }
    ]
