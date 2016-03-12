var Field, KeyMotion, Player, TimeKeeper, globalObject;

globalObject = require('./global_object');

Field = require('./model/field');

Player = require('./model/player');

KeyMotion = require('./model/key_motion');

TimeKeeper = require('./model/time_keeper');

$(function() {
  var player;
  Field.draw();
  player = new Player();
  player.draw();
  new TimeKeeper(player).watch();
  $(document).on('keydown', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    if (keyMotion.pushedArrowKey()) {
      return player.move(keyMotion.direction);
    }
  });
  $(document).on('keyup', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    if (keyMotion.pushedArrowKey()) {
      return player.stop(keyMotion.direction);
    }
  });
  $(document).on('keydown', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    if (keyMotion.pushedSpaceKey()) {
      return player.shot();
    }
  });
  return $(document).on('keyup', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    if (keyMotion.pushedSpaceKey()) {
      return player.stopShotting();
    }
  });
});
