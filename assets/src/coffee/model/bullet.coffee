# 親クラスをロード
Actor = require './actor'

module.exports = class Bullet extends Actor
  constructor: (actor) ->
    @details = actor.bulletDetails
    super(
      actor.width + 20,
      actor.height,
      0,
      0,
      @details.radius,
      @details.hitPoint
    )

  hide: ->
    @stop @details.direction

  # override
  show: ->
    super @details.color

  # override
  calculateDistance: ->
    if @canMoveTo.right then @right @details.distance else @move @details.direction

  # override
  attack: (targetActor) ->
    super targetActor
    @hide() if @isDead()
    targetActor.hide() if targetActor.isDead()

  reuse: (actor) ->
    @width    = actor.width + 20
    @height   = actor.height
    @hitPoint = actor.bulletDetails.hitPoint
    @radius   = actor.bulletDetails.radius
