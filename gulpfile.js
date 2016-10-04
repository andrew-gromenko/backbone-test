var coffeeify = require('gulp-coffeeify'),
    gulp = require('gulp'),
    sass = require('gulp-sass'),
    uglify = require('gulp-uglify'),
    concat = require('gulp-concat'),
    filter = require('gulp-filter'),
    deleteFile = require('gulp-delete-file'),
    concatCss = require('gulp-concat-css');

var config = {
    vendorSass: './vendor/twbs'
}

gulp.task('coffee', function() {
    return gulp.src([
            './web/app/src/models/**/*.coffee',
            './web/app/src/collection/**/*.coffee',
            './web/app/src/views/**/*.coffee',
            './web/app/src/app.coffee'
        ])
        .pipe(concat('app.coffee'))
        .pipe(gulp.dest('./web/app/dist/'))
        .pipe(coffeeify())
        .pipe(gulp.dest('./web/app/dist/'));
});

gulp.task('clean', ['coffee'], function() {
    return gulp.src('./web/app/dist/**/*.*')
        .pipe(deleteFile({
            reg: /.*\.coffee/gim,
            deleteMatch: true
        }))
})

gulp.task('sass', function() {
    return gulp.src('./web/app/assets/sass/**/*.scss')
        .pipe(sass({
                includePaths: config.vendorSass + '/bootstrap-sass/assets/stylesheets'
            })
            .on('error', sass.logError))
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest('./web/app/dist'));
});

gulp.task('vendor:sass', function() {
    return gulp.src('.vendor/twbs/bootstrap-sass/assets/stylesheets/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest('./web/app/dist'));
});

gulp.task('vendor:js', function() {
    return gulp.src([
            './vendor/components/jquery/jquery.js',
            './vendor/components/underscore/underscore.js',
            './vendor/components/backbone/backbone.js',
            './vendor/twbs/bootstrap-sass/assets/javascripts/**/*.js'
        ])
        .pipe(concat('vendor.js'))
        .pipe(gulp.dest('./web/app/dist'));
});

gulp.task('watch', function() {
    gulp.watch('./web/app/assets/sass/**/*.scss', ['sass']);
    gulp.watch('./web/app/**/*.coffee', ['coffee', 'clean']);
});

gulp.task('default', ['vendor:js', 'vendor:sass', 'coffee','clean', 'sass', 'watch']);
