'use strict'

var gulp = require('gulp');
var sourcemaps = require('gulp-sourcemaps');
var coffee = require('gulp-coffee');
var streamqueue = require('streamqueue');
var rimraf = require('gulp-rimraf');
var coffeelint = require('gulp-coffeelint');
var watch = require('gulp-watch');

gulp.task('default', ['coffee'], function() { })

gulp.task('coffee', function() {
  return streamqueue({ objectMode: true },
    gulp.src('src/**/*.js')
      .pipe(rimraf()),
  	gulp.src('src/**/*.coffee')
      .pipe(coffeelint())
      .pipe(coffeelint.reporter())
      .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(sourcemaps.write())
      .pipe(gulp.dest(function(file) { return file.base; }))
  )
});