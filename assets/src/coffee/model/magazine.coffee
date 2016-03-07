Bullet = require './bullet'

module.exports = class Magazine
  constructor: ->
    @list = []

  drawActiveBullets: ->
    for bullet in _getActiveBullets.call @
      bullet.move()

  _getActiveBullets = ->
    bullet for bullet in @list when bullet.active_flg is true
