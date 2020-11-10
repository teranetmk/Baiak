(function($) {

    'use strict';

    // Define the baiakscroll namespace and default settings
    $.baiakscroll = {
        defaults: {
            debug: false,
            autoTrigger: true,
            autoTriggerUntil: false,
            loadingHtml: '<small>Loading...</small>',
            loadingFunction: false,
            padding: 0,
            nextSelector: '',
            contentSelector: '',
            pagingSelector: '',
            callback: false
        }
    };

    // Constructor
    var baiakscroll = function($e, options) {

        // Private vars and methods
        var _data = $e.data('baiakscroll'),
            _userOptions = (typeof options === 'function') ? { callback: options } : options,
            _options = $.extend({}, $.baiakscroll.defaults, _userOptions, _data || {}),
            _isWindow = ($e.css('overflow-y') === 'visible'),
            _$next = $e.find(_options.nextSelector).first(),
            _$window = $(window),
            _$body = $('body'),
            _$scroll = _isWindow ? _$window : $e,
            _nextHref = $.trim(_$next.prop('href') + ' ' + _options.contentSelector),

            // Check if a loading image is defined and preload
            _preloadImage = function() {
                var src = $(_options.loadingHtml).filter('img').attr('src');
                if (src) {
                    var image = new Image();
                    image.src = src;
                }
            },

            // Wrap inner content, if it isn't already
            _wrapInnerContent = function() {
                if (!$e.find('.baiak-scroll-inner').length) {
                    $e.contents().wrapAll('<div class="baiak-scroll-inner" />');
                }
            },

            // Find the next link's parent, or add one, and hide it
            _nextWrap = function($next) {
                var $parent;
                if (_options.pagingSelector) {
                    $next.closest(_options.pagingSelector).hide();
                } else {
                    $parent = $next.parent().not('.baiak-scroll-inner,.baiak-scroll-added').addClass('baiakscroll-next-parent').hide();
                    if (!$parent.length) {
                        $next.wrap('<div class="baiakscroll-next-parent" />').parent().hide();
                    }
                }
            },

            // Remove the baiakscroll behavior and data from an element
            _destroy = function() {
                return _$scroll.unbind('.baiakscroll')
                    .removeData('baiakscroll')
                    .find('.baiak-scroll-inner').children().unwrap()
                    .filter('.baiak-scroll-added').children().unwrap();
            },

            // Observe the scroll event for when to trigger the next load
            _observe = function() {
                if ($e.is(':visible')) {
                    _wrapInnerContent();
                    var $inner = $e.find('div.baiak-scroll-inner').first(),
                        data = $e.data('baiakscroll'),
                        borderTopWidth = parseInt($e.css('borderTopWidth'), 10),
                        borderTopWidthInt = isNaN(borderTopWidth) ? 0 : borderTopWidth,
                        iContainerTop = parseInt($e.css('paddingTop'), 10) + borderTopWidthInt,
                        iTopHeight = _isWindow ? _$scroll.scrollTop() : $e.offset().top,
                        innerTop = $inner.length ? $inner.offset().top : 0,
                        iTotalHeight = Math.ceil(iTopHeight - innerTop + _$scroll.height() + iContainerTop);

                    if (!data.waiting && iTotalHeight + _options.padding >= $inner.outerHeight()) {
                        _debug('info', 'baiakscroll:', $inner.outerHeight() - iTotalHeight, 'from bottom. Loading next request...');
                        return _load();
                    }
                }
            },

            // Check if the href for the next set of content has been set
            _checkNextHref = function(data) {
                data = data || $e.data('baiakscroll');
                if (!data || !data.nextHref) {
                    _debug('warn', 'baiakscroll: nextSelector not found - destroying');
                    _destroy();
                    return false;
                } else {
                    _setBindings();
                    return true;
                }
            },

            _setBindings = function() {
                var $next = $e.find(_options.nextSelector).first();
                if (!$next.length) {
                    return;
                }
                if (_options.autoTrigger && (_options.autoTriggerUntil === false || _options.autoTriggerUntil > 0)) {
                    _nextWrap($next);
                    var scrollingBodyHeight = _$body.height() - $e.offset().top,
                        scrollingHeight = ($e.height() < scrollingBodyHeight) ? $e.height() : scrollingBodyHeight,
                        windowHeight = ($e.offset().top - _$window.scrollTop() > 0) ? _$window.height() - ($e.offset().top - $(window).scrollTop()) : _$window.height();
                    if (scrollingHeight <= windowHeight) {
                        _observe();
                    }
                    _$scroll.unbind('.baiakscroll').bind('scroll.baiakscroll', function() {
                        return _observe();
                    });
                    if (_options.autoTriggerUntil > 0) {
                        _options.autoTriggerUntil--;
                    }
                } else {
                    _$scroll.unbind('.baiakscroll');
                    $next.bind('click.baiakscroll', function() {
                        _nextWrap($next);
                        _load();
                        return false;
                    });
                }
            },

            // Load the next set of content, if available
            _load = function() {
                var $inner = $e.find('div.baiak-scroll-inner').first(),
                    data = $e.data('baiakscroll');

                data.waiting = true;
                $inner.append('<div class="baiak-scroll-added" />')
                    .children('.baiak-scroll-added').last()
                    .html('<div class="baiakscroll-loading" id="baiakscroll-loading">' + _options.loadingHtml + '</div>')
                    .promise()
                    .done(function() {
                        if (_options.loadingFunction) {
                            _options.loadingFunction();
                        }
                    });

                return $e.animate({scrollTop: $inner.outerHeight()}, 0, function() {
                    var nextHref = data.nextHref;
                    $inner.find('div.baiak-scroll-added').last().load(nextHref, function(r, status) {
                        if (status === 'error') {
                            return _destroy();
                        }
                        var $next = $(this).find(_options.nextSelector).first();
                        data.waiting = false;
                        data.nextHref = $next.prop('href') ? $.trim($next.prop('href') + ' ' + _options.contentSelector) : false;
                        $('.baiakscroll-next-parent', $e).remove(); // Remove the previous next link now that we have a new one
                        _checkNextHref();
                        if (_options.callback) {
                            _options.callback.call(this, nextHref);
                        }
                        _debug('dir', data);
                    });
                });
            },

            // Safe console debug - http://klauzinski.com/javascript/safe-firebug-console-in-javascript
            _debug = function(m) {
                if (_options.debug && typeof console === 'object' && (typeof m === 'object' || typeof console[m] === 'function')) {
                    if (typeof m === 'object') {
                        var args = [];
                        for (var sMethod in m) {
                            if (typeof console[sMethod] === 'function') {
                                args = (m[sMethod].length) ? m[sMethod] : [m[sMethod]];
                                console[sMethod].apply(console, args);
                            } else {
                                console.log.apply(console, args);
                            }
                        }
                    } else {
                        console[m].apply(console, Array.prototype.slice.call(arguments, 1));
                    }
                }
			};

        // Initialization
        $e.data('baiakscroll', $.extend({}, _data, {initialized: true, waiting: false, nextHref: _nextHref}));
        _wrapInnerContent();
        _preloadImage();
        _setBindings();

        // Expose API methods via the jQuery.baiakscroll namespace, e.g. $('sel').baiakscroll.method()
        $.extend($e.baiakscroll, {
            destroy: _destroy
        });
        return $e;
    };

    // Define the baiakscroll plugin method and loop
    $.fn.baiakscroll = function(m) {
        return this.each(function() {
            var $this = $(this),
                data = $this.data('baiakscroll');

            // Instantiate baiakscroll on this element if it hasn't been already
            if (data && data.initialized) {
                return;
            }
            baiakscroll($this, m);
        });
    };

})(jQuery);