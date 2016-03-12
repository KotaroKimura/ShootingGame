var Actor, Bullet,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Actor = require('./actor');

module.exports = Bullet = (function(superClass) {
  var DISTANCE, RADIUS;

  extend(Bullet, superClass);

  RADIUS = 5;

  DISTANCE = 'right';

  function Bullet(play_width, play_height) {
    Bullet.__super__.constructor.call(this, play_width + 15, play_height, 0, 0);
  }

  Bullet.prototype.clear = function() {
    return this.stop(DISTANCE);
  };

  Bullet.prototype.draw = function() {
    return Bullet.__super__.draw.call(this, '#87CEEB', RADIUS);
  };

  Bullet.prototype.decideBehavior = function() {
    if (this.active_flg.right === true) {
      this.distance_width = 15;
    } else {
      this.move(DISTANCE);
    }
    return Bullet.__super__.decideBehavior.apply(this, arguments);
  };

  return Bullet;

})(Actor);
