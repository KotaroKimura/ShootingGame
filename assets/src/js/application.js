var Field, KeyMotion, Player, TimeKeeper, exports;

exports = this;

exports.globalObject = {
  loop_flg: true,
  field: {
    width: 980,
    height: 500
  },
  canvas: $('canvas#field')
};

Field = (function() {
  function Field() {}

  Field.draw = function() {
    exports.globalObject.canvas[0].width = exports.globalObject.field.width;
    return exports.globalObject.canvas[0].height = exports.globalObject.field.height;
  };

  return Field;

})();

Player = (function() {
  var ACCELERATION, FRICTION, RADIUS;

  RADIUS = 10;

  ACCELERATION = 0.4;

  FRICTION = 0.91;

  function Player() {
    this.direction = {
      left: false,
      up: false,
      right: false,
      down: false
    };
    this.width = 20;
    this.height = (exports.globalObject.field.height - RADIUS) / 2;
    this.distance_width = 0;
    this.distance_height = 0;
  }

  Player.prototype.move = function(keyCode) {
    var keyMotion;
    keyMotion = new KeyMotion(keyCode);
    if (keyMotion.pushedArrowKey()) {
      return this.direction[keyMotion.direction] = true;
    }
  };

  Player.prototype.stop = function(keyCode) {
    var keyMotion;
    keyMotion = new KeyMotion(keyCode);
    if (keyMotion.pushedArrowKey()) {
      return this.direction[keyMotion.direction] = false;
    }
  };

  Player.prototype.redraw = function() {
    this.clear();
    this.decideBehavior();
    return this.draw();
  };

  Player.prototype.calculateAcceleration = function() {
    if (this.direction.left) {
      this.distance_width -= ACCELERATION;
    }
    if (this.direction.right) {
      this.distance_width += ACCELERATION;
    }
    if (this.direction.up) {
      this.distance_height -= ACCELERATION;
    }
    if (this.direction.down) {
      return this.distance_height += ACCELERATION;
    }
  };

  Player.prototype.calculateFriction = function() {
    this.distance_width = this.distance_width * FRICTION;
    return this.distance_height = this.distance_height * FRICTION;
  };

  Player.prototype.decideBehavior = function() {
    this.calculateAcceleration();
    this.calculateFriction();
    this.width += this.distance_width;
    return this.height += this.distance_height;
  };

  Player.prototype.draw = function() {
    return exports.globalObject.canvas.drawArc({
      fillStyle: '#fff',
      x: this.width,
      y: this.height,
      radius: RADIUS
    });
  };

  Player.prototype.clear = function() {
    return exports.globalObject.canvas.clearCanvas();
  };

  return Player;

})();

KeyMotion = (function() {
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

TimeKeeper = (function() {
  function TimeKeeper() {
    this.time = 0;
  }

  TimeKeeper.prototype.watch = function() {
    if (exports.globalObject.loop_flg === true) {
      return setTimeout(function(timeKeeper) {
        exports.globalObject.player.redraw();
        return timeKeeper.watch();
      }, 15, this);
    }
  };

  return TimeKeeper;

})();

$(function() {
  Field.draw();
  exports.globalObject.player = new Player();
  exports.globalObject.player.draw();
  return new TimeKeeper().watch();
});

$(document).on('keydown', 'body', function(e) {
  return exports.globalObject.player.move(e.keyCode);
});

$(document).on('keyup', 'body', function(e) {
  return exports.globalObject.player.stop(e.keyCode);
});
