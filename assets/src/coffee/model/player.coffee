# グローバル変数をロード
globalObject = require '../global_object'

# モデルクラスをロード
Actor = require './actor'

module.exports = class Player extends Actor
  RADIUS   = 10
  DISTANCE = 10
  constructor: ->
    @shot_flg = false
    super 20, (globalObject.field.height - RADIUS) / 2, 0, 0

  ### パブリックメソッド群 ###
  shot: ->
    @shot_flg = true

  stopShotting: ->
    @shot_flg = false

  # override
  draw: ->
    super '#fff', RADIUS

  # override
  calculateDistanceEachActor: ->
    @left  DISTANCE if _canMoveLeft.call @
    @right DISTANCE if _canMoveRight.call @
    @up    DISTANCE if _canMoveUp.call @
    @down  DISTANCE if _canMoveDown.call @

  ### プライベートメソッド群 ###
  _canMoveLeft = ->
    @active_flg.left and @width > RADIUS

  _canMoveRight = ->
    @active_flg.right and @width < globalObject.field.width - RADIUS

  _canMoveUp = ->
    @active_flg.up and @height > RADIUS

  _canMoveDown = ->
    @active_flg.down and @height < globalObject.field.height - RADIUS
