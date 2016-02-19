(function() {
  var Field, Player, exports;

  exports = this;

  exports.global_object = {
    color: {
      black: '#000',
      white: '#fff'
    },
    field: {
      width: 980,
      height: 500
    },
    canvas: $('canvas#field')
  };

  Field = (function() {
    function Field() {}

    Field.prototype.draw = function() {
      exports.global_object['canvas'][0].width = exports.global_object['field']['width'];
      return exports.global_object['canvas'][0].height = exports.global_object['field']['height'];
    };

    return Field;

  })();

  Player = (function() {
    function Player() {}

    Player.prototype.draw = function() {
      var radius;
      radius = 10;
      return exports.global_object['canvas'].drawArc({
        fillStyle: exports.global_object['color']['white'],
        x: (exports.global_object['field']['width'] - radius) / 2,
        y: exports.global_object['field']['height'] - 20,
        radius: radius
      });
    };

    return Player;

  })();

  (function() {
    new Field().draw();
    return new Player().draw();
  })();

}).call(this);
