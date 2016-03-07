var Actor, Bullet, Magazine, Player, globalObject,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

globalObject = require('../global_object');

Actor = require('./actor');

Bullet = require('./bullet');

Magazine = require('./magazine');

module.exports = Player = (function(superClass) {
  var ACCELERATION, FRICTION, RADIUS, _calculateAcceleration, _calculateFriction, _shotLoadedBullet, _shotNewBullet;

  extend(Player, superClass);

  RADIUS = 10;

  ACCELERATION = 0.9;

  FRICTION = 0.91;

  function Player() {
    this.magazine = new Magazine();
    this.active_flg = {
      left: false,
      up: false,
      right: false,
      down: false
    };
    Player.__super__.constructor.call(this, 20, (globalObject.field.height - RADIUS) / 2, 0, 0);
  }

  Player.prototype.move = function(direction) {
    return this.active_flg[direction] = true;
  };

  Player.prototype.stop = function(direction) {
    return this.active_flg[direction] = false;
  };

  Player.prototype.draw = function() {
    return Player.__super__.draw.call(this, '#fff', RADIUS);
  };

  Player.prototype.decideBehavior = function() {
    _calculateAcceleration.call(this);
    _calculateFriction.call(this);
    return Player.__super__.decideBehavior.apply(this, arguments);
  };

  Player.prototype.shotBullet = function() {
    var reloaded_bullets;
    reloaded_bullets = this.magazine.getreloadedBullets();
    if (reloaded_bullets.length === 0) {
      return _shotNewBullet.call(this);
    } else {
      return _shotLoadedBullet.call(this, reloaded_bullets[0]);
    }
  };

  _shotNewBullet = function() {
    var bullet;
    bullet = new Bullet(this.width, this.height);
    bullet.shot();
    return this.magazine.list.push(bullet);
  };

  _shotLoadedBullet = function(reloaded_bullet) {
    reloaded_bullet.width = this.width;
    reloaded_bullet.height = this.height;
    return reloaded_bullet.shot();
  };

  _calculateAcceleration = function() {
    if (this.active_flg.left) {
      this.distance_width -= ACCELERATION;
    }
    if (this.active_flg.right) {
      this.distance_width += ACCELERATION;
    }
    if (this.active_flg.up) {
      this.distance_height -= ACCELERATION;
    }
    if (this.active_flg.down) {
      return this.distance_height += ACCELERATION;
    }
  };

  _calculateFriction = function() {
    this.distance_width = this.distance_width * FRICTION;
    return this.distance_height = this.distance_height * FRICTION;
  };

  return Player;

})(Actor);
