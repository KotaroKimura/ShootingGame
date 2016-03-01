var KeyMotion;

module.exports = KeyMotion = (function() {
  var ARROW_KEY;

  ARROW_KEY = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down'
  };

  function KeyMotion(code) {
    this.code = code;
    this.direction = ARROW_KEY[this.code];
  }

  KeyMotion.prototype.pushedArrowKey = function() {
    if (this.direction === void 0) {
      return false;
    } else {
      return true;
    }
  };

  KeyMotion.prototype.pushedSpaceKey = function() {
    if (this.code === 32) {
      return true;
    } else {
      return false;
    }
  };

  return KeyMotion;

})();
