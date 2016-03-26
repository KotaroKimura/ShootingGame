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
  generateEnemyDetail: ->
    return [] if @appearance_rate < Math.round Math.random() * 100

    race         = _selectRace.call @
    motion       = _selectMotion.call @, race.type
    turningPoint = _selectTurningPoint.call @, motion
    [
      race  : race
      motion:
        type        : motion
        turningPoint: turningPoint
      width : globalObject.field.width
      height: _selectHeight.call @
    ]

  ### プライベートメソッド群 ###
  _selectRace = ->
    randomNumber = Math.round Math.random() * 100
    if $.inArray(randomNumber, [1..33]) isnt -1
      Race.giant
    else if $.inArray(randomNumber, [34..66]) isnt -1
      Race.rush
    else
      Race.pawn

  _selectMotion = (race) ->
    randomNumber = Math.round Math.random() * 100
    if $.inArray(randomNumber, [1..5]) isnt -1
      return Motion.jump
    else if $.inArray(randomNumber, [6..10]) isnt -1
      return Motion.zigzag
    else if $.inArray(randomNumber, [11..20]) isnt -1
      return Motion.upStairs
    else if $.inArray(randomNumber, [21..30]) isnt -1
      return Motion.downStairs
    else if $.inArray(randomNumber, [31..35]) isnt -1
      return Motion.randomStairs
    else if $.inArray(randomNumber, [36..45]) isnt -1
      return Motion.upSlanting
    else if $.inArray(randomNumber, [46..55]) isnt -1
      return Motion.downSlanting
    Motion.straight

  _selectTurningPoint = (motion) ->
    if motion is Motion.straight
      undefined
    else
      Math.floor Math.random() * 40 + 10

  _selectHeight = ->
    (Math.floor Math.random() * [50..(globalObject.field.height - 50)].length) + 50
