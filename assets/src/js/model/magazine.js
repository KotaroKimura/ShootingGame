var Bullet, Magazine, globalObject;

globalObject = require('../global_object');

Bullet = require('./bullet');

module.exports = Magazine = (function() {
  function Magazine() {
    this.list = [];
  }

  Magazine.prototype.drawBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.getActiveBullets();
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (globalObject.field.width > bullet.width) {
        results.push(bullet.move());
      } else {
        results.push(bullet.init());
      }
    }
    return results;
  };

  Magazine.prototype.getreloadedBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.list;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (bullet.active_flg !== true) {
        results.push(bullet);
      }
    }
    return results;
  };

  Magazine.prototype.getActiveBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.list;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (bullet.active_flg === true) {
        results.push(bullet);
      }
    }
    return results;
  };

  return Magazine;

})();
