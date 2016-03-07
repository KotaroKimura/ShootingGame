var Bullet, Magazine;

Bullet = require('./bullet');

module.exports = Magazine = (function() {
  var _getActiveBullets;

  function Magazine() {
    this.list = [];
  }

  Magazine.prototype.drawActiveBullets = function() {
    var bullet, i, len, ref, results;
    ref = _getActiveBullets.call(this);
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      results.push(bullet.move());
    }
    return results;
  };

  _getActiveBullets = function() {
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
