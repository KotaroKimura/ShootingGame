var Bullet, Magazine, globalObject;

globalObject = require('../global_object');

Bullet = require('./bullet');

module.exports = Magazine = (function() {
  function Magazine() {
    this.list = [];
  }

  Magazine.prototype.drawActiveBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.getActiveBullets();
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (globalObject.field.width > bullet.width) {
        results.push(bullet.move());
      } else {
        results.push(bullet.clear());
      }
    }
    return results;
  };

  Magazine.prototype.getReloadedBullets = function() {
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

  Magazine.prototype.logBullets = function() {
    console.log("弾倉内の銃弾総数は「" + this.list.length + "」");
    console.log("画面上に表示中の銃弾数は「" + (this.getActiveBullets().length) + "」");
    return console.log("再利用可能な銃弾数は「" + (this.getReloadedBullets().length) + "」");
  };

  return Magazine;

})();
