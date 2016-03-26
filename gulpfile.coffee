gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
webpack = require 'gulp-webpack'
runSequence = require 'run-sequence'

gulp.task 'compile main', ->
  gulp.src 'assets/src/coffee/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/'

gulp.task 'compile model', ->
  gulp.src 'assets/src/coffee/model/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/model'

gulp.task 'compile concern', ->
  gulp.src 'assets/src/coffee/model/concern/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/model/concern'

gulp.task 'compile extend', ->
  gulp.src 'assets/src/coffee/extend/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/extend'

gulp.task 'compile config', ->
  gulp.src 'assets/src/coffee/config/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/config'

gulp.task 'compile config-enemy', ->
  gulp.src 'assets/src/coffee/config/enemy/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/config/enemy'

gulp.task 'webpack', ->
  gulp.src 'assets/src/js/main.js'
    .pipe webpack require './webpack.config.js'
    .pipe gulp.dest 'assets/build'

gulp.task 'compile', (callback) ->
  runSequence ['compile main', 'compile model', 'compile concern', 'compile config', 'compile config-enemy', 'compile extend']

gulp.task 'default', ->
  runSequence ['compile']
