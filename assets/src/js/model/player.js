var Actor, Player, globalObject,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

globalObject = require('../global_object');

Actor = require('./actor');

module.exports = Player = (function(superClass) {
  var ACCELERATION, FRICTION, RADIUS, _calculateAcceleration, _calculateFriction;

  extend(Player, superClass);

  RADIUS = 10;

  ACCELERATION = 0.9;

  FRICTION = 0.91;

  function Player() {
    this.shot_flg = false;
    Player.__super__.constructor.call(this, 20, (globalObject.field.height - RADIUS) / 2, 0, 0);
  }


  /* パブリックメソッド群 */

  Player.prototype.shot = function() {
    return this.shot_flg = true;
  };

  Player.prototype.stopShotting = function() {
    return this.shot_flg = false;
  };

  Player.prototype.draw = function() {
    return Player.__super__.draw.call(this, '#fff', RADIUS);
  };

  Player.prototype.decideBehavior = function() {
    _calculateAcceleration.call(this);
    _calculateFriction.call(this);
    return Player.__super__.decideBehavior.apply(this, arguments);
  };


  /* プライベートメソッド群 */

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
