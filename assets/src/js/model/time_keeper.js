var Canvas, TimeKeeper, globalObject;

globalObject = require('../global_object');

Canvas = require('./concern/canvas');

module.exports = TimeKeeper = (function() {
  function TimeKeeper(player) {
    Canvas.prototype.augment(this);
    this.times = 0;
    this.monitored_object = {
      player: player
    };
  }

  TimeKeeper.prototype.watch = function() {
    return setTimeout(function(self) {
      self.clear();
      self.monitored_object.player.draw();
      globalObject.magazine.drawBullets(self.times, self.monitored_object.player);
      self.times++;
      return self.watch();
    }, 15, this);
  };

  return TimeKeeper;

})();
