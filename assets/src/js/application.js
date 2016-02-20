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

  Field.prototype.draw = function() {
    exports.globalObject['canvas'][0].width = exports.globalObject['field']['width'];
    return exports.globalObject['canvas'][0].height = exports.globalObject['field']['height'];
  };

  return Field;

})();

Player = (function() {
  var DISTANCE, RADIUS;

  RADIUS = 10;

  DISTANCE = 5;

  function Player() {
    this.direction = {
      left: false,
      up: false,
      right: false,
      down: false
    };
    this.width = (exports.globalObject['field']['width'] - RADIUS) / 2;
    this.height = exports.globalObject['field']['height'] - 20;
  }

  Player.prototype.run = function(keyCode) {
    var keyMotion;
    keyMotion = new KeyMotion(keyCode);
    if (keyMotion.pushedArrowKey()) {
      return this.direction[keyMotion.code] = true;
    }
  };

  Player.prototype.stop = function(keyCode) {
    var keyMotion;
    keyMotion = new KeyMotion(keyCode);
    if (keyMotion.pushedArrowKey()) {
      return this.direction[keyMotion.code] = false;
    }
  };

  Player.prototype.move = function() {
    this.clear();
    this.judgeBehavior();
    return this.draw();
  };

  Player.prototype.judgeBehavior = function() {
    if (this.direction['left']) {
      this.width -= DISTANCE;
    }
    if (this.direction['right']) {
      this.width += DISTANCE;
    }
    if (this.direction['up']) {
      this.height -= DISTANCE;
    }
    if (this.direction['down']) {
      return this.height += DISTANCE;
    }
  };

  Player.prototype.draw = function() {
    return exports.globalObject['canvas'].drawArc({
      fillStyle: '#fff',
      x: this.width,
      y: this.height,
      radius: RADIUS
    });
  };

  Player.prototype.clear = function() {
    return exports.globalObject['canvas'].clearCanvas();
  };

  return Player;

})();

KeyMotion = (function() {
  var CODE;

  CODE = {
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down'
  };

  function KeyMotion(keyCode) {
    this.code = CODE[keyCode];
  }

  KeyMotion.prototype.pushedArrowKey = function() {
    if (this.code === void 0) {
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
    if (exports.globalObject['loop_flg'] === true) {
      return setTimeout(function(timeKeeper) {
        exports.globalObject['player'].move();
        return timeKeeper.watch();
      }, 1000 / 60, this);
    }
  };

  return TimeKeeper;

})();

$(function() {
  new Field().draw();
  exports.globalObject['player'] = new Player();
  exports.globalObject['player'].draw();
  return new TimeKeeper().watch();
});

$(document).on('keydown', 'body', function(e) {
  return exports.globalObject['player'].run(e.keyCode);
});

$(document).on('keyup', 'body', function(e) {
  return exports.globalObject['player'].stop(e.keyCode);
});
