/**
 * Inheritance plugin 1.0.9
 *
 * Copyright (c) 2009 Filatov Dmitry (alpha@zforms.ru)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Minor modification by chesco@
 * '__self' property renamed to 'self'
 *
 */

(function ($) {

    var
        hasIntrospection = (function () {
            _
        }).toString().indexOf('_') > -1,
        emptyBase = function () {
        }
        ;

    $.inherit = function () {

        var
            hasBase = $.isFunction(arguments[0]),
            base = hasBase ? arguments[0] : emptyBase,
            props = arguments[hasBase ? 1 : 0] || {},
            staticProps = arguments[hasBase ? 2 : 1],
            result = props.__constructor || base.prototype.__constructor ?
                function () {
                    this.__constructor.apply(this, arguments);
                } : function () {
            },
            inheritance = function () {
            }
            ;

        $.extend(result, base, staticProps);

        inheritance.prototype = base.prototype;
        result.prototype = new inheritance();
        result.prototype.self = result.prototype.constructor = result;

        var propList = [];
        $.each(props, function (i) {
            if (props.hasOwnProperty(i)) {
                propList.push(i);
            }
        });
        // fucking ie hasn't toString, valueOf in for
        $.each(['toString', 'valueOf'], function () {
            if (props.hasOwnProperty(this) && $.inArray(this, propList) == -1) {
                propList.push(this);
            }
        });

        $.each(propList, function () {
            if (hasBase
                && $.isFunction(base.prototype[this]) && $.isFunction(props[this])
                && (!hasIntrospection || props[this].toString().indexOf('.__base') > -1)) {

                (function (methodName) {
                    var
                        baseMethod = base.prototype[methodName],
                        overrideMethod = props[methodName]
                        ;
                    result.prototype[methodName] = function () {
                        var baseSaved = this.__base;
                        this.__base = baseMethod;
                        var result = overrideMethod.apply(this, arguments);
                        this.__base = baseSaved;
                        return result;
                    };
                })(this);

            }
            else {
                result.prototype[this] = props[this];
            }
        });

        return result;

    };

})(jQuery);


/* -----------------------------------------------------*/

Function.prototype.scope = function (o) {
    var fn = this;
    return function () {
        return fn.apply(o, arguments);
    };
};


/* -----------------------------------------------------*/

/**
 * Tagged EventBus plugin
 *
 * Copyright (c) 2009 Filatov Dmitry (alpha@zforms.ru)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * @version 001.2.001
 * @requires $.identify
 *
 */

(function ($) {

    var tagsToList = function (tags) {
            return ($.isArray(tags) ? tags : tags.split(' ')).sort();
        },
        getCombinations = (function () {
            var cache = [];
            return function (length) {

                if (cache[length]) {
                    return cache[length];
                }

                for (var i = 1, result = []; i < (1 << length); ++i) {
                    for (var j = i, k = 0, subresult = []; k <= length; ++k, j >>= 1) {
                        j & 0x1 && subresult.push(k);
                    }
                    result.push(subresult);
                }

                return cache[length] = result;

            };
        })();
    getTagCombinations = (function () {
        var cache = {};
        return function (tagList) {

            var tagHash = tagList.join(' ');
            if (cache[tagHash]) {
                return cache[tagHash];
            }
            var combinations = getCombinations(tagList.length), result = [];
            for (var i = 0, ilength = combinations.length; i < ilength; i++) {
                var tagCombination = [], combination = combinations[i];
                for (var j = 0, jlength = combinations[i].length; j < jlength; j++) {
                    tagCombination.push(tagList[combination[j]]);
                }
                result.push(tagCombination.join(' '));
            }
            return cache[tagHash] = result;

        };
    })();

    var tagsToIds = {};

    $.eventBus = {

        bind:function (tags, fn, ctx, data) {

            if (typeof tags != 'string') {
                $.each(tags, function (tag) {
                    $.eventBus.bind(tag, this, fn); // there is fn = ctx
                });
            }
            else {
                var tagHash = tagsToList(tags).join(' ');
                (tagsToIds[tagHash] || (tagsToIds[tagHash] = {}))[$.identify(fn) + (ctx ? ' ' + $.identify(ctx) : '')] = {
                    fn:fn,
                    ctx:ctx,
                    data:data
                };
            }

            return this;

        },

        unbind:function (tags, fn, ctx) {

            if (typeof tags != 'string') {
                $.each(tags, function (tag) {
                    $.eventBus.unbind(tag, this, fn); // there is fn = ctx
                });
            }
            else {
                var tagHash = tagsToList(tags).join(' ');
                tagsToIds[tagHash] && fn ?
                    tagsToIds[tagHash][$.identify(fn) + (ctx ? ' ' + $.identify(ctx) : '')] &&
                        delete tagsToIds[tagHash][$.identify(fn) + (ctx ? ' ' + $.identify(ctx) : '')] :
                    delete tagsToIds[tagHash];
            }

            return this;

        },

        trigger:function (event, data) {

            var event = typeof event == 'string' ? $.Event(event) : event,
                fns = [], uniqIds = {};
            $.each(getTagCombinations(tagsToList(event.type)), function () {
                var tags = this;
                tagsToIds[tags] && $.each(tagsToIds[tags], function (id) {
                    if (!uniqIds[id]) {
                        fns.push({
                            tagCount:tags.split(' ').length,
                            fn:this.fn,
                            ctx:this.ctx,
                            data:this.data
                        });
                        uniqIds[id] = id;
                    }
                });
            });
            $.each(fns.sort(function (a, b) {
                return a.tagCount - b.tagCount;
            }), function () {
                if (event.isImmediatePropagationStopped()) {
                    return false;
                }
                this.fn.call(this.ctx || window, event, data, this.data);
            });

            return this;

        }

    };

})(jQuery);


/**
 * Identify plugin
 *
 * Copyright (c) 2009 Filatov Dmitry (alpha@zforms.ru)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * @version 001.0.0
 */

(function ($) {

    var idCounter = 1;

    $.identify = function (obj) {
        return obj.__id || (obj.__id = idCounter++);
    };

})(jQuery);


var Gallery = $.inherit(
    {
        __constructor:function (jContainer) {
            this.jContainer = jContainer;

            $('>div.item', this.jContainer).map(function (i, e) {
                return new GalleryItem($(e));
            });

            this.jShowcase = $('>div.showcase:first', this.jContainer);
            //this.jShowcase.find('ins.i').click(function(){ this.close() }.scope(this));
            this.jShowcase.click(function () {
                this.close()
            }.scope(this));

            $.eventBus.bind('gallery click', function (oEvent, oItem) {
                this.show(oItem)
            }, this);
        },

        close:function () {
            this.jShowcase.addClass('hidden');
        },

        show:function (oItem) {
            var hPos = oItem.getPosition();
            this.jShowcase
                .css({
                    left:hPos.left - 82,
                    top:hPos.top - 82
                })
                .find('img').attr('src', oItem.getBigSrc())
                .end().removeClass('hidden')
                .find('.name').html(oItem.getName())
                .end().find('.post').html(oItem.getPost());
        }
    });

var GalleryItem = $.inherit(
    {
        __constructor:function (jItem) {
            this.jItem = jItem;
            this.jPic = jItem.find('img');
            this.jPic.hover(
                function () {
                    $(this).stop().css({opacity:0.5});
                },
                function () {
                    $(this).clearQueue().animate({opacity:1});
                }
            ).click(
                function () {
                    $.eventBus.trigger('gallery click', this);
                }.scope(this)
            );
        },

        getBigSrc:function () {
            var bigPath = this.jPic.attr('src');
            var url_begin = bigPath.substr(0, 36);
            var medium_part = "medium/"
            var url_end = bigPath.substr(42);
            var all = url_begin.concat(medium_part, url_end);
            return all;
        },

        getName:function () {
            return this.jItem.find('.name').html();
        },

        getPost:function () {
            return this.jItem.find('.position').html();
        },

        getPosition:function () {
            return this.jItem.position();
        }
    });

$(function () {
    new Gallery($('#gallery'));
});