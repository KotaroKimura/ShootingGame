var Actor, globalObject;

globalObject = require('../global_object');

module.exports = Actor = (function() {
  var _clear, _drawArc;

  function Actor(width, height, distance_width, distance_height) {
    this.width = width;
    this.height = height;
    this.distance_width = distance_width;
    this.distance_height = distance_height;
  }

  Actor.prototype.draw = function(color, radius) {
    _clear.call(this);
    this.decideBehavior();
    return _drawArc.call(this, color, radius);
  };

  Actor.prototype.decideBehavior = function() {
    this.width += this.distance_width;
    return this.height += this.distance_height;
  };

  _drawArc = function(color, radius) {
    return globalObject.canvas.drawArc({
      fillStyle: color,
      x: this.width,
      y: this.height,
      radius: radius
    });
  };

  _clear = function() {
    return globalObject.canvas.clearCanvas();
  };

  return Actor;

})();
