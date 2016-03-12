var Actor, globalObject;

globalObject = require('../global_object');

module.exports = Actor = (function() {
  var _drawArc;

  function Actor(width, height, distance_width, distance_height) {
    this.width = width;
    this.height = height;
    this.distance_width = distance_width;
    this.distance_height = distance_height;
    this.active_flg = {
      left: false,
      up: false,
      right: false,
      down: false
    };
  }

  Actor.prototype.move = function(direction) {
    return this.active_flg[direction] = true;
  };

  Actor.prototype.stop = function(direction) {
    return this.active_flg[direction] = false;
  };

  Actor.prototype.relocate = function(play_width, play_height) {
    this.width = play_width;
    return this.height = play_height;
  };

  Actor.prototype.decideBehavior = function() {
    this.width += this.distance_width;
    return this.height += this.distance_height;
  };

  Actor.prototype.draw = function(color, radius) {
    this.decideBehavior();
    return _drawArc.call(this, color, radius);
  };

  _drawArc = function(color, radius) {
    return globalObject.canvas.drawArc({
      fillStyle: color,
      x: this.width,
      y: this.height,
      radius: radius
    });
  };

  return Actor;

})();
