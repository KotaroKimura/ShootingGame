Math.square = (number) ->
  number * number

Math.randomNumber = (range) ->
  Math.floor Math.random() * range

Math.randomBool = ->
  Math.round Math.random()

module.exports = Math
