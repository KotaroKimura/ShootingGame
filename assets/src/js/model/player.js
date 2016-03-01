var Player, Resource, globalObject,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

globalObject = require('../global_object');

Resource = require('./resource');

module.exports = Player = (function(superClass) {
  var ACCELERATION, FRICTION, RADIUS, _calculateAcceleration, _calculateFriction, _clear;

  extend(Player, superClass);

  RADIUS = 10;

  ACCELERATION = 0.9;

  FRICTION = 0.91;

  function Player() {
    this.action_flg = {
      left: false,
      up: false,
      right: false,
      down: false
    };
    Player.__super__.constructor.call(this, 20, (globalObject.field.height - RADIUS) / 2, 0, 0);
  }

  Player.prototype.move = function(direction) {
    return this.action_flg[direction] = true;
  };

  Player.prototype.stop = function(direction) {
    return this.action_flg[direction] = false;
  };

  Player.prototype.redraw = function() {
    _clear.call(this);
    this.decideBehavior();
    return this.draw();
  };

  Player.prototype.decideBehavior = function() {
    _calculateAcceleration.call(this);
    _calculateFriction.call(this);
    return Player.__super__.decideBehavior.apply(this, arguments);
  };

  Player.prototype.draw = function() {
    return globalObject.canvas.drawArc({
      fillStyle: '#fff',
      x: this.width,
      y: this.height,
      radius: RADIUS
    });
  };

  _calculateAcceleration = function() {
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

  _calculateFriction = function() {
    this.distance_width = this.distance_width * FRICTION;
    return this.distance_height = this.distance_height * FRICTION;
  };

  _clear = function() {
    return globalObject.canvas.clearCanvas();
  };

  return Player;

})(Resource);
