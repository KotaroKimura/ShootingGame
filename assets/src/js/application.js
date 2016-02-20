var Field, Movement, Player, TimeKeeper, exports;

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
  function Player() {
    this.radius = 10;
    this.width = (exports.globalObject['field']['width'] - this.radius) / 2;
    this.height = exports.globalObject['field']['height'] - 20;
  }

  Player.prototype.draw = function() {
    return exports.globalObject['canvas'].drawArc({
      fillStyle: '#fff',
      x: this.width,
      y: this.height,
      radius: this.radius
    });
  };

  Player.prototype.clear = function() {
    return exports.globalObject['canvas'].clearCanvas();
  };

  return Player;

})();

Movement = (function() {
  var DISTANCE, KEYDOWN, _controlMovingDirection, _pushedArrowKey;

  DISTANCE = 5;

  KEYDOWN = {
    left: 37,
    up: 38,
    right: 39,
    down: 40
  };

  function Movement(keyCode) {
    this.keyCode = keyCode;
  }

  Movement.prototype.doMove = function() {
    if (_pushedArrowKey.call(this)) {
      _controlMovingDirection.call(this);
      exports.globalObject['player'].clear();
      return exports.globalObject['player'].draw();
    }
  };

  _controlMovingDirection = function() {
    switch (this.keyCode) {
      case KEYDOWN['left']:
        return exports.globalObject['player'].width -= DISTANCE;
      case KEYDOWN['up']:
        return exports.globalObject['player'].height -= DISTANCE;
      case KEYDOWN['right']:
        return exports.globalObject['player'].width += DISTANCE;
      case KEYDOWN['down']:
        return exports.globalObject['player'].height += DISTANCE;
    }
  };

  _pushedArrowKey = function() {
    if ($.inArray(this.keyCode, [KEYDOWN['left'], KEYDOWN['up'], KEYDOWN['right'], KEYDOWN['down']]) !== -1) {
      return true;
    } else {
      return false;
    }
  };

  return Movement;

})();

TimeKeeper = (function() {
  function TimeKeeper() {
    this.time = 0;
  }

  TimeKeeper.prototype.watch = function() {
    if (exports.globalObject['loop_flg'] === true) {
      return setTimeout(function(timeKeeper) {
        console.log(timeKeeper.time += 1);
        return timeKeeper.watch();
      }, 1000 / 60, this);
    }
  };

  return TimeKeeper;

})();

$(function() {
  var field;
  exports.globalObject['timeKeeper'] = new TimeKeeper();
  exports.globalObject['player'] = new Player();
  field = new Field();
  exports.globalObject['timeKeeper'].watch();
  exports.globalObject['player'].draw();
  return field.draw();
});

$(document).on('keydown', 'body', function(e) {
  return new Movement(e.keyCode).doMove();
});
