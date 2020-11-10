/*!-----------------------------------------------------------------
    Name: Baiak
    Version: 1.0
    Author: Danyel Varejao
    Website: http://baiak.com.br
    Copyright 2020.
-------------------------------------------------------------------*/
    /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */,
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
/*------------------------------------------------------------------

  Theme Options

-------------------------------------------------------------------*/
var options = {
    scrollToAnchorSpeed: 700,

    templates: {
        secondaryNavbarBackItem: 'Back',

        plainVideoIcon: '<span class="baiak-video-icon"><span class="fa fa-play pl-5"></span></span>',
        plainVideoLoadIcon: '<span class="baiak-video-icon"><span class="baiak-loading-icon"></span></span>',

        audioPlainButton: '<div class="baiak-audio-plain-play-pause">\n                <span class="baiak-audio-plain-play">\n                    <span class="ion-play ml-3"></span>\n                </span>\n                <span class="baiak-audio-plain-pause">\n                    <span class="ion-pause"></span>\n                </span>\n            </div>',

        instagram: '<div class="col-4">\n                <a href="{{link}}" target="_blank">\n                    <img src="{{image}}" alt="{{caption}}" class="baiak-img-stretch">\n                </a>\n            </div>',
        instagramLoadingText: 'Loading...',
        instagramFailText: 'Failed to fetch data',
        instagramApiPath: 'php/instagram/instagram.php',

        twitter: '<div class="baiak-twitter">\n                <span class="baiak-twitter-icon fab fa-twitter"></span>\n                <div class="baiak-twitter-name">\n                      <a href="https://twitter.com/{{screen_name}}" target="_blank">@{{screen_name}}</a>\n                </div>\n                <div class="baiak-twitter-date">\n                    <span>{{date}}</span>\n                </div>\n                <div class="baiak-twitter-text">\n                   {{tweet}}\n                </div>\n            </div>',
        twitterLoadingText: 'Loading...',
        twitterFailText: 'Failed to fetch data',
        twitterApiPath: 'php/twitter/tweet.php',

        countdown: '<div class="baiak-hexagon">\n                <div class="baiak-hexagon-inner"></div>\n                <span>%D</span>\n                <small>Days</small>\n            </div>\n            <div class="baiak-hexagon">\n                <div class="baiak-hexagon-inner"></div>\n                <span>%H</span>\n                <small>Hours</small>\n            </div>\n            <div class="baiak-hexagon">\n                <div class="baiak-hexagon-inner"></div>\n                <span>%M</span>\n                <small>Minutes</small>\n            </div>\n            <div class="baiak-hexagon">\n                <div class="baiak-hexagon-inner"></div>\n                <span>%S</span>\n                <small>Seconds</small>\n            </div>'
    }
};

exports.options = options;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(3);


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _options = __webpack_require__(1);

if (typeof window.Baiak !== 'undefined') {
    window.Baiak.setOptions(_options.options);
    window.Baiak.init();
}

/***/ })
/******/ ]);