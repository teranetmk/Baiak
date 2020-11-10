const path = require('path')
const fs = require('fs-extra')
const mix = require('laravel-mix')

mix.styles([
	'public/assets/vendor/bootstrap/dist/css/bootstrap.css',
	'public/assets/vendor/ionicons/css/ionicons.min.css',
	'public/assets/vendor/photoswipe/dist/photoswipe.css',
	'public/assets/vendor/photoswipe/dist/default-skin/default-skin.css',
	'public/assets/vendor/bootstrap-slider/dist/css/bootstrap-slider.min.css',
	'public/assets/vendor/summernote/dist/summernote-bs4.css',
	'public/assets/vendor/iziToast/dist/css/iziToast.css',
	'public/assets/css/fonts.css',
	'public/assets/css/baiak.css',
	'public/assets/css/custom.css'
], 'public/css/all.css');

mix.scripts([
	'public/assets/vendor/fontawesome-free/js/all.js',
	'public/assets/vendor/fontawesome-free/js/v4-shims.js',
	'public/assets/vendor/jquery/dist/jquery.min.js'
], 'public/js/pre-load.js');

mix.scripts([
	'public/assets/vendor/object-fit-images/dist/ofi.min.js',
	'public/assets/vendor/gsap/src/minified/TweenMax.min.js',
	'public/assets/vendor/gsap/src/minified/plugins/ScrollToPlugin.min.js',
	'public/assets/vendor/popper.js/dist/umd/popper.min.js',
	'public/assets/vendor/bootstrap/dist/js/bootstrap.min.js',
	'public/assets/vendor/sticky-kit/dist/sticky-kit.min.js',
	'public/assets/vendor/jarallax/dist/jarallax.min.js',
	'public/assets/vendor/jarallax/dist/jarallax-video.min.js',
	'public/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js',
	'public/assets/vendor/flickity/dist/flickity.pkgd.min.js',
	'public/assets/vendor/photoswipe/dist/photoswipe.min.js',
	'public/assets/vendor/photoswipe/dist/photoswipe-ui-default.min.js',
	'public/assets/vendor/jquery-validation/dist/jquery.validate.min.js',
	'public/assets/vendor/jquery-countdown/dist/jquery.countdown.min.js',
	'public/assets/vendor/jquery-mask/dist/jquery.mask.min.js',
	'public/assets/vendor/jquery-jscroll/jscroll.js',
	'public/assets/vendor/moment/min/moment.min.js',
	'public/assets/vendor/moment-timezone/builds/moment-timezone-with-data.min.js',
	'public/assets/vendor/hammerjs/hammer.min.js',
	'public/assets/vendor/nanoscroller/bin/javascripts/jquery.nanoscroller.js',
	'public/assets/vendor/soundmanager2/script/soundmanager2-nodebug-jsmin.js',
	'public/assets/vendor/bootstrap-slider/dist/bootstrap-slider.min.js',
	'public/assets/vendor/summernote/dist/summernote-bs4.min.js',
	'public/assets/plugins/baiak-share/baiak-share.js',
	'public/assets/vendor/clipboard/dist/clipboard.min.js',
	'public/assets/js/baiak.js',
	'public/assets/js/baiak-init.js',
	'public/assets/js/custom.js',
], 'public/js/all.js');

mix.copy('public/assets/fonts', 'public/fonts');

// Vue APP
mix
	.js('resources/js/app.js', 'public/dist/js')
	.disableNotifications()

if (mix.inProduction()) {
	mix.version()
} else {
	mix.sourceMaps()
}

mix.options({
	terser: {
		extractComments: false,
	}
})

mix.webpackConfig({
	plugins: [
		
	],
	resolve: {
		extensions: ['.js', '.json', '.vue'],
		alias: {
			'~': path.join(__dirname, './resources/js')
		}
	},
	output: {
		chunkFilename: 'dist/js/[chunkhash].js',
		path: mix.config.hmr ? '/' : path.resolve(__dirname, './public/build')
	}
})

mix.then(() => {
	if (!mix.config.hmr) {
		process.nextTick(() => publishAseets())
	}
})

function publishAseets () {
	const publicDir = path.resolve(__dirname, './public')

	if (mix.inProduction()) {
		fs.removeSync(path.join(publicDir, 'dist'))
	}

	fs.copySync(path.join(publicDir, 'build', 'dist'), path.join(publicDir, 'dist'))
	fs.removeSync(path.join(publicDir, 'build'))
}
