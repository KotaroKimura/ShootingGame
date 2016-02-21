var Field, KeyMotion, Player, TimeKeeper, globalObject;

globalObject = require('./global_object.js');

Field = require('./model/field.js');

Player = require('./model/player.js');

KeyMotion = require('./model/key_motion.js');

TimeKeeper = require('./model/time_keeper.js');

$(function() {
  Field.draw();
  globalObject.player = new Player();
  globalObject.player.draw();
  return new TimeKeeper().watch();
});

$(document).on('keydown', 'body', function(e) {
  var keyMotion;
  keyMotion = new KeyMotion(e.keyCode);
  if (keyMotion.pushedArrowKey()) {
    return globalObject.player.move(keyMotion.direction);
  }
});

$(document).on('keyup', 'body', function(e) {
  var keyMotion;
  keyMotion = new KeyMotion(e.keyCode);
  if (keyMotion.pushedArrowKey()) {
    return globalObject.player.stop(keyMotion.direction);
  }
});
