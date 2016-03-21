class Mixin
  augment: (t) ->
    (t[n] = m unless n == 'augment' or !this[n].prototype?) for n, m of this

### EnemyMotionクラス ###
# Enemyクラスのオブジェクトの画面上の動きに関して、操作を行うクラス

module.exports = class EnemyMotion extends Mixin
  DIRECTION =
    left : 'left'
    up   : 'up'
    right: 'right'
    down : 'down'
  straight: ->
    @move DIRECTION.left
