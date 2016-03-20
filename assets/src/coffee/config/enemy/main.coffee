# 敵の種族情報をロード
Race = require './race'

module.exports =
  100:
    [
      {
        race  : Race.pawn
        width : 1000
        height: 100
      },
      {
        race  : Race.rush
        width : 1000
        height: 200
      },
      {
        race  : Race.giant
        width : 1000
        height: 300
      }
    ]
