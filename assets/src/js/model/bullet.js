var Actor, Bullet,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Actor = require('./actor');

module.exports = Bullet = (function(superClass) {
  var RADIUS;

  extend(Bullet, superClass);

  RADIUS = 5;

  function Bullet(play_width, play_height) {
    this.active_flg = false;
    Bullet.__super__.constructor.call(this, play_width + 15, play_height, 0, 0);
  }

  Bullet.prototype.clear = function() {
    this.width = 0;
    this.height = 0;
    return this.active_flg = false;
  };

  Bullet.prototype.shot = function() {
    this.active_flg = true;
    return this.draw();
  };

  Bullet.prototype.relocate = function(play_width, play_height) {
    this.width = play_width;
    return this.height = play_height;
  };

  Bullet.prototype.move = function() {
    this.distance_width = 15;
    return this.draw();
  };

  Bullet.prototype.draw = function() {
    return Bullet.__super__.draw.call(this, '#87CEEB', RADIUS);
  };

  return Bullet;

})(Actor);
