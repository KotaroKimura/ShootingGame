var TimeKeeper, globalObject;

globalObject = require('../global_object');

module.exports = TimeKeeper = (function() {
  function TimeKeeper() {
    this.times = 0;
  }

  TimeKeeper.prototype.watch = function() {
    return setTimeout(function(timeKeeper) {
      globalObject.canvas.clearCanvas();
      globalObject.player.draw();
      globalObject.player.drawBullets(timeKeeper.times);
      globalObject.player.magazine.logBullets();
      timeKeeper.times++;
      return timeKeeper.watch();
    }, 20, this);
  };

  return TimeKeeper;

})();
