var Field, globalObject;

globalObject = require('../global_object');

module.exports = Field = (function() {
  function Field() {}

  Field.draw = function() {
    globalObject.canvas[0].width = globalObject.field.width;
    return globalObject.canvas[0].height = globalObject.field.height;
  };

  return Field;

})();
