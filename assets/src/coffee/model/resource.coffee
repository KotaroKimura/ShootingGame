module.exports = class Resource
  constructor: (@width, @height, @distance_width, @distance_height) ->

  decideBehavior: ->
    @width += @distance_width
    @height += @distance_height
