# グローバル変数をロード
globalObject = require '../../config/global'

class Mixin
  augment: (t) ->
    (t[n] = m unless n == 'augment' or !this[n].prototype?) for n, m of this

### EnemyMotionクラス ###
# Enemyクラスのオブジェクトの画面上の動きに関して、操作を行うクラス

module.exports = class EnemyMotion extends Mixin
  DIRECTION =
    left : 'left'
    up   : 'up'
    down : 'down'

  ### パブリックメソッド群 ###
  straight:
    ->
      @move DIRECTION.left if @times is 0

  upSlanting:
    ->
      unless @height < @radius * 2 then @move DIRECTION.up else @stop DIRECTION.up
      @move DIRECTION.left if @times isnt 0

  downSlanting:
    ->
      unless @height > globalObject.field.height - @radius * 2 then @move DIRECTION.down else @stop DIRECTION.down
      @move DIRECTION.left if @times isnt 0

  zigzag:
    ->
      _correctPosition.call @
      @move DIRECTION.left if @times is 0
      return if @times % @turningPoint isnt 0
      if _canChangeDirection.call @
        @move DIRECTION.up
        @stop DIRECTION.down
      else
        @move DIRECTION.down
        @stop DIRECTION.up

  upStairs:
    ->
      if @height < @radius * 2 or _canChangeDirection.call @
        @move DIRECTION.left
        @stop DIRECTION.up
      else
        @move DIRECTION.up
        @stop DIRECTION.left

  downStairs:
    ->
      if @height > globalObject.field.height - @radius * 2 or _canChangeDirection.call @
        @move DIRECTION.left
        @stop DIRECTION.down
      else
        @move DIRECTION.down
        @stop DIRECTION.left

  randomStairs:
    ->
      _correctPosition.call @
      return unless @times % @turningPoint is 0
      if _canChangeDirection.call @
        @move DIRECTION.left
        @stop DIRECTION.up
        @stop DIRECTION.down
      else
        if Math.round Math.random() then @move DIRECTION.up else @move DIRECTION.down
        @stop DIRECTION.left

  jump:
    ->
      @move DIRECTION.left if @times is 0
      return unless @times % @turningPoint is 0
      if _canChangeDirection.call @
        @height = (Math.floor Math.random() * [50..(globalObject.field.height - 50)].length) + 50

  ### プライベートメソッド群 ###
  _canChangeDirection = ->
    Math.floor(@times / @turningPoint) % 2 is 0

  _correctPosition = ->
    if @height > globalObject.field.height - @radius
      @move DIRECTION.up
      @move DIRECTION.left
      @stop DIRECTION.down
      return

    if @height < @radius
      @move DIRECTION.down
      @move DIRECTION.left
      @stop DIRECTION.up
      return
