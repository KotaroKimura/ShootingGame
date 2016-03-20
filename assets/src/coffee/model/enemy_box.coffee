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
        hideEnemies = _getDeadEnemies.call @
        if hideEnemies.length is 0
          _birthNewEnemy.call @, detail
        else
          hideEnemies[0].reShow detail

  _getAppearableEnemyDetails = (loopTimes) ->
    details for popTime, details of EnemyInfo when loopTimes is +popTime

  _getDeadEnemies = ->
    enemy for enemy in @box when not enemy.isActive()

  _birthNewEnemy = (detail) ->
    enemy = new Enemy detail
    enemy.show()
    @box.push enemy

  _drawActiveEnemies = ->
    for enemy in _getActiveEnemies.call @
      if 0 < enemy.width + enemy.radius then enemy.show() else enemy.die()

  _getActiveEnemies = ->
    enemy for enemy in @box when enemy.isActive()
