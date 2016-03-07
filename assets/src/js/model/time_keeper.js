var TimeKeeper, globalObject;

globalObject = require('../global_object');

module.exports = TimeKeeper = (function() {
  function TimeKeeper() {}

  TimeKeeper.prototype.watch = function() {
    return setTimeout(function(timeKeeper) {
      globalObject.canvas.clearCanvas();
      globalObject.player.draw();
      globalObject.player.magazine.drawBullets();
      return timeKeeper.watch();
    }, 15, this);
  };

  return TimeKeeper;

})();
