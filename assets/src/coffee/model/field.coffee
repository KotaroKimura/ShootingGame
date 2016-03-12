# グローバル変数をロード
globalObject = require '../global_object'

# キャンバスに対して操作を行うモジュールをロード
Canvas = require './concern/canvas'

module.exports = class Field
  constructor: ->
    Canvas::augment @

  draw: ->
    @drawField globalObject.field.width, globalObject.field.height
