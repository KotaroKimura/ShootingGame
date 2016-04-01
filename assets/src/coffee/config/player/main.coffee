# グローバル変数をロード
globalObject = require '../global'

### Playerクラスのメイン情報オブジェクト ###
# 実機生成に必要な情報を格納したオブジェクト
# オブジェクトの構成は以下の通り
#
# {
#   radius  : 半径の大きさ
#   distance: 移動距離
#   color   : 色
#   hitPoint: ヒットポイント
#   width   : 初期値のx座標
#   height  : 初期値のy座標
#   bullets :
#     type     : 実機が打った弾の、タイプ
#     direction: 実機が打った弾が、どの方向に動くのか
#     color    : 実機が打った弾の、色
#     distance : 実機が打った弾の、移動距離
#     hitPoint : 実機が打った弾の、ヒットポイント
#     radius   : 実機が打った弾の、半径
# }

module.exports =
  radius  : 15
  distance: 10
  color   : '#ffa500'
  hitPoint: 1
  width   : 20
  height  : (globalObject.field.height - 15) / 2
  bullets :
    type     : 'player'
    direction: 'right'
    color    : '#ffa500'
    distance : 15
    hitPoint : 1
    radius   : 5
