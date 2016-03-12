var Canvas, Field, globalObject;

globalObject = require('../global_object');

Canvas = require('./concern/canvas');

module.exports = Field = (function() {
  function Field() {
    Canvas.prototype.augment(this);
  }

  Field.prototype.draw = function() {
    return this.drawField(globalObject.field.width, globalObject.field.height);
  };

  return Field;

})();
