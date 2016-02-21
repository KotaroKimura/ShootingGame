gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
webpack = require 'gulp-webpack'
runSequence = require 'run-sequence'

gulp.task 'main.coffee', ->
  gulp.src 'assets/src/coffee/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/'

gulp.task 'model.coffee', ->
  gulp.src 'assets/src/coffee/model/*.coffee'
    .pipe coffee({ bare: true })
    .pipe gulp.dest 'assets/src/js/model'

gulp.task 'webpack', ->
  gulp.src 'assets/src/js/main.js'
    .pipe webpack({ output: { filename: 'build.js' } })
    .pipe gulp.dest 'assets/build'

gulp.task 'compile.coffee', ->
  runSequence 'main.coffee', 'model.coffee'

gulp.task 'default', ->
  runSequence 'compile.coffee', 'webpack'
