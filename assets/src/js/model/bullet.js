var Actor, Bullet,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Actor = require('./actor');

module.exports = Bullet = (function(superClass) {
  var RADIUS;

  extend(Bullet, superClass);

  RADIUS = 5;

  function Bullet(play_width, play_height) {
    this.action_flg = false;
    Bullet.__super__.constructor.call(this, play_width + 10, play_height, 0, 0);
  }

  Bullet.prototype.shot = function(color, radius) {
    this.action_flg = true;
    return this.draw('#87CEEB', RADIUS);
  };

  return Bullet;

})(Actor);
