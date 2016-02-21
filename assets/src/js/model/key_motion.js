var KeyMotion;

module.exports = KeyMotion = (function() {
  var KEY;

  KEY = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down'
  };

  function KeyMotion(code) {
    this.direction = KEY[code];
  }

  KeyMotion.prototype.pushedArrowKey = function() {
    if (this.direction === void 0) {
      return false;
    } else {
      return true;
    }
  };

  return KeyMotion;

})();
