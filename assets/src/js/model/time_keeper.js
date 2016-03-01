var TimeKeeper, globalObject;

globalObject = require('../global_object');

module.exports = TimeKeeper = (function() {
  function TimeKeeper() {
    this.time = 0;
  }

  TimeKeeper.prototype.watch = function() {
    if (globalObject.loop_flg === true) {
      return setTimeout(function(timeKeeper) {
        globalObject.player.draw();
        return timeKeeper.watch();
      }, 15, this);
    }
  };

  return TimeKeeper;

})();
