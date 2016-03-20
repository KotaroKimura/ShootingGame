# 敵に関する情報を持ったオブジェクトをロード
EnemyInfo = require '../config/enemy/main'

# モデルクラスをロード
Enemy = require './enemy'

### EnemyBoxクラス ###
# Enemyクラスのオブジェクトを配列として格納し、その操作を行うクラス

module.exports = class EnemyBox
  constructor: ->
    @box = []

  ### パブリックメソッド群 ###
  showEnemies: (loopTimes) ->
    _drawNewEnemy.call @, loopTimes
    _drawActiveEnemies.call @

  ### プライベートメソッド群 ###
  _drawNewEnemy = (loopTimes) ->
    for details in _getAppearableEnemyDetails.call @, loopTimes
      for detail in details
        hideEnemies = _getHideEnemies.call @
        if hideEnemies.length is 0
          _birthNewEnemy.call @, detail
        else
          hideEnemies[0].reShow detail

  _getAppearableEnemyDetails = (loopTimes) ->
    details for popTime, details of EnemyInfo when loopTimes is +popTime

  _getHideEnemies = ->
    enemy for enemy in @box when not enemy.canMoveTo.left

  _birthNewEnemy = (detail) ->
    enemy = new Enemy detail
    enemy.show()
    @box.push enemy

  _drawActiveEnemies = ->
    for enemy in _getActiveEnemies.call @
      if 0 < enemy.width then enemy.show() else enemy.hide()

  _getActiveEnemies = ->
    enemy for enemy in @box when enemy.canMoveTo.left
