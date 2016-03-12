var Bullet, Magazine, globalObject;

globalObject = require('../global_object');

Bullet = require('./bullet');


/* Magazineクラス */

module.exports = Magazine = (function() {
  var _canShotBullet, _drawActiveBullets, _drawshotedBullet, _getActiveBullets, _getReloadedBullets, _shotNewBullet, _shotReloadedBullet;

  function Magazine() {
    this.list = [];
  }


  /* パブリックメソッド群 */

  Magazine.prototype.drawBullets = function(loop_times, actor) {
    _drawshotedBullet.call(this, loop_times, actor);
    return _drawActiveBullets.call(this);
  };


  /* プライベートメソッド群 */

  _drawshotedBullet = function(loop_times, actor) {
    var height, reloaded_bullets, width;
    width = actor.width;
    height = actor.height;
    reloaded_bullets = _getReloadedBullets.call(this);
    if (!_canShotBullet.call(this, loop_times, actor.shot_flg)) {
      return;
    }
    if (reloaded_bullets.length === 0) {
      return _shotNewBullet.call(this, width, height);
    } else {
      return _shotReloadedBullet.call(this, reloaded_bullets[0], width, height);
    }
  };

  _drawActiveBullets = function() {
    var bullet, i, len, ref, results;
    ref = _getActiveBullets.call(this);
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (globalObject.field.width > bullet.width) {
        results.push(bullet.draw());
      } else {
        results.push(bullet.clear());
      }
    }
    return results;
  };

  _getActiveBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.list;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (bullet.active_flg.right === true) {
        results.push(bullet);
      }
    }
    return results;
  };

  _getReloadedBullets = function() {
    var bullet, i, len, ref, results;
    ref = this.list;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      bullet = ref[i];
      if (bullet.active_flg.right !== true) {
        results.push(bullet);
      }
    }
    return results;
  };

  _canShotBullet = function(loop_times, shot_flg) {
    if ((shot_flg === true) && (loop_times % 10 === 0)) {
      return true;
    } else {
      return false;
    }
  };

  _shotNewBullet = function(width, height) {
    var bullet;
    bullet = new Bullet(width, height);
    bullet.draw();
    return this.list.push(bullet);
  };

  _shotReloadedBullet = function(bullet, width, height) {
    bullet.relocate(width, height);
    return bullet.draw();
  };

  return Magazine;

})();
