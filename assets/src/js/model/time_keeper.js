var TimeKeeper, globalObject;

globalObject = require('../global_object');

module.exports = TimeKeeper = (function() {
  function TimeKeeper(player) {
    this.player = player;
    this.times = 0;
  }

  TimeKeeper.prototype.watch = function() {
    return setTimeout(function(timeKeeper) {
      globalObject.canvas.clearCanvas();
      timeKeeper.player.draw();
      timeKeeper.player.drawBullets(timeKeeper.times);
      timeKeeper.times++;
      return timeKeeper.watch();
    }, 15, this);
  };

  return TimeKeeper;

})();
