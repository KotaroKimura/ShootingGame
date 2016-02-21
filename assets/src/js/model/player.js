var Player, globalObject;

globalObject = require('../global_object.js');

module.exports = Player = (function() {
  var ACCELERATION, FRICTION, RADIUS;

  RADIUS = 10;

  ACCELERATION = 0.4;

  FRICTION = 0.91;

  function Player() {
    this.action_flg = {
      left: false,
      up: false,
      right: false,
      down: false
    };
    this.width = 20;
    this.height = (globalObject.field.height - RADIUS) / 2;
    this.distance_width = 0;
    this.distance_height = 0;
  }

  Player.prototype.move = function(direction) {
    return this.action_flg[direction] = true;
  };

  Player.prototype.stop = function(direction) {
    return this.action_flg[direction] = false;
  };

  Player.prototype.redraw = function() {
    this.clear();
    this.decideBehavior();
    return this.draw();
  };

  Player.prototype.calculateAcceleration = function() {
    if (this.action_flg.left) {
      this.distance_width -= ACCELERATION;
    }
    if (this.action_flg.right) {
      this.distance_width += ACCELERATION;
    }
    if (this.action_flg.up) {
      this.distance_height -= ACCELERATION;
    }
    if (this.action_flg.down) {
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
    return globalObject.canvas.drawArc({
      fillStyle: '#fff',
      x: this.width,
      y: this.height,
      radius: RADIUS
    });
  };

  Player.prototype.clear = function() {
    return globalObject.canvas.clearCanvas();
  };

  return Player;

})();
