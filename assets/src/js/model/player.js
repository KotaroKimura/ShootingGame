var Actor, Bullet, Player, globalObject,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

globalObject = require('../global_object');

Actor = require('./actor');

Bullet = require('./bullet');

module.exports = Player = (function(superClass) {
  var ACCELERATION, FRICTION, RADIUS, _calculateAcceleration, _calculateFriction;

  extend(Player, superClass);

  RADIUS = 10;

  ACCELERATION = 0.9;

  FRICTION = 0.91;

  function Player() {
    this.magazines = [];
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

  Player.prototype.shotBullet = function() {
    var bullet;
    bullet = new Bullet(this.width, this.height);
    bullet.shot();
    return this.magazines.push(bullet);
  };

  Player.prototype.draw = function() {
    return Player.__super__.draw.call(this, '#fff', RADIUS);
  };

  Player.prototype.decideBehavior = function() {
    _calculateAcceleration.call(this);
    _calculateFriction.call(this);
    return Player.__super__.decideBehavior.apply(this, arguments);
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

  return Player;

})(Actor);
