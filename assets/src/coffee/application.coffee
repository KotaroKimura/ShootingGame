# グローバル変数を宣言
exports = this
exports.global_object = {
  color: {
    black: '#000',
    white: '#fff'
  },
  field: {
    width: 980,
    height: 500
  }
  canvas: $('canvas#field')
}

class Field
  draw: ->
    exports.global_object['canvas'][0].width = exports.global_object['field']['width']
    exports.global_object['canvas'][0].height = exports.global_object['field']['height']

class Player
  draw: ->
    radius = 10
    exports.global_object['canvas'].drawArc(
      {
        fillStyle: exports.global_object['color']['white'],
        x: (exports.global_object['field']['width'] - radius) / 2,
        y: exports.global_object['field']['height'] - 20,
        radius: radius
      }
    )

do ->
  new Field().draw()
  new Player().draw()
