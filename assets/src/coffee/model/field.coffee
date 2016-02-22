# グローバル変数をロード
globalObject = require '../global_object'

module.exports = class Field
  @draw: ->
    globalObject.canvas[0].width = globalObject.field.width
    globalObject.canvas[0].height = globalObject.field.height
