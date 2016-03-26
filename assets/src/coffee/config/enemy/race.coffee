### Enemyクラスの種族情報オブジェクト ###
# 敵の種族に関する情報を格納したオブジェクト
# オブジェクトの構成は以下の通り
#
# 種族名:
#   type     : 種族名
#   radius   : 大きさ
#   distance : 移動距離
#   color    : 色

module.exports =
  pawn: #ポーン種(標準種)
    type    : 'pawn'
    radius  : 15
    distance: 5
    color   : '#20b2aa'
    hitPont : 3
  rush: #ラッシュ種(突進種)
    type    : 'rush'
    radius  : 10
    distance: 15
    color   : '#20b2aa'
    hitPont : 1
  giant: #ジャイアント種(巨大種)
    type    : 'giant'
    radius  : 30
    distance: 2
    color   : '#20b2aa'
    hitPont : 10
