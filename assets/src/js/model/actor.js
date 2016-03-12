var Actor, Canvas;

Canvas = require('./concern/canvas');

module.exports = Actor = (function() {
  function Actor(width, height, distance_width, distance_height) {
    this.width = width;
    this.height = height;
    this.distance_width = distance_width;
    this.distance_height = distance_height;
    Canvas.prototype.augment(this);
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
    return this.drawArc(color, radius);
  };

  return Actor;

})();
