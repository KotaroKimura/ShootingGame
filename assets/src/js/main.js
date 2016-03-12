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
    return keyMotion.decidePlayerMotion(player, keyMotion.type.down);
  });
  $(document).on('keyup', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    return keyMotion.decidePlayerMotion(player, keyMotion.type.up);
  });
  $(document).on('keydown', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    return keyMotion.decideBulletMotion(player, keyMotion.type.down);
  });
  return $(document).on('keyup', 'body', function(e) {
    var keyMotion;
    keyMotion = new KeyMotion(e.keyCode);
    return keyMotion.decideBulletMotion(player, keyMotion.type.up);
  });
});
