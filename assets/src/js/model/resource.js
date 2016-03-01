var Resource;

module.exports = Resource = (function() {
  function Resource(width, height, distance_width, distance_height) {
    this.width = width;
    this.height = height;
    this.distance_width = distance_width;
    this.distance_height = distance_height;
  }

  Resource.prototype.decideBehavior = function() {
    this.width += this.distance_width;
    return this.height += this.distance_height;
  };

  return Resource;

})();
