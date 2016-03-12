var KeyMotion;

module.exports = KeyMotion = (function() {
  var ARROW_KEY, SPACE_KEY, _pushedArrowKey, _pushedSpaceKey;

  SPACE_KEY = 32;

  ARROW_KEY = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down'
  };

  function KeyMotion(code) {
    this.code = code;
    this.type = {
      up: 'keyup',
      down: 'keydown'
    };
    this.direction = ARROW_KEY[this.code];
  }

  KeyMotion.prototype.decidePlayerMotion = function(player, key_event) {
    if (!_pushedArrowKey.call(this)) {
      return;
    }
    if (key_event === this.type.up) {
      return player.stop(this.direction);
    }
    if (key_event === this.type.down) {
      return player.move(this.direction);
    }
  };

  KeyMotion.prototype.decideBulletMotion = function(player, key_event) {
    if (!_pushedSpaceKey.call(this)) {
      return;
    }
    if (key_event === this.type.up) {
      return player.stopShotting();
    }
    if (key_event === this.type.down) {
      return player.shot();
    }
  };

  _pushedArrowKey = function() {
    if (this.direction === void 0) {
      return false;
    } else {
      return true;
    }
  };

  _pushedSpaceKey = function() {
    if (this.code === SPACE_KEY) {
      return true;
    } else {
      return false;
    }
  };

  return KeyMotion;

})();
