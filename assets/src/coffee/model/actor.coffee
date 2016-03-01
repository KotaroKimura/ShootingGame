module.exports = class Actor
  constructor: (@width, @height, @distance_width, @distance_height) ->

  decideBehavior: ->
    @width += @distance_width
    @height += @distance_height
