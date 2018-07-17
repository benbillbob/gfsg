;(function($, window, document, undefined) {

    // Init global DOM elements, functions and arrays
    window.app 			 				= {el : {}, fn : {}};
    app.el['window']     				= $(window);
    app.el['document']   				= $(document);
    app.el['body']     				    = $('body');
    app.el['back-to-top'] 				= $('.back-to-top');
    app.el['html-body'] 				= $('html,body');
    app.el['animated']   				= $('.animated');
    app.el['loader']        			= $('#loader');
    app.el['mask']          			= $('#mask');
    app.el['header']          			= $('header');
    app.el['navbar-nav'] 				= $('.navbar-nav li.dropdown');

    $(function() {

        //Open navbar dropdown on hover
        app.el['navbar-nav'].on({
            mouseenter: function() {
                if(app.el['window'].width()>769){
                    $(this).addClass('open');
                }
            }, mouseleave: function() {
                if(app.el['window'].width()>769){
                    $(this).removeClass('open');
                }
            }
        });

        // Back to top
        // fade in .back-to-top
        app.el['window'].scroll(function () {
            if ($(this).scrollTop() > 500) {
                app.el['back-to-top'].fadeIn();
            } else {
                app.el['back-to-top'].fadeOut();
            }
        });
        // scroll body to 0px on click
        app.el['back-to-top'].click(function () {
            app.el['html-body'].animate({
                scrollTop: 0
            }, 750);
            return false;
        });

        // Debounce event
        // https://davidwalsh.name/javascript-debounce-function
        function debounce(func, wait, immediate) {
            var timeout;
            return function() {
                var context = this, args = arguments;
                var later = function() {
                    timeout = null;
                    if (!immediate) func.apply(context, args);
                };
                var callNow = immediate && !timeout;
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
                if (callNow) func.apply(context, args);
            };
        };

        // Fixed top
        var fixedTopElmn = $('.fixed-top');
        if(fixedTopElmn.length){
            var fixedTopEmlnShadow = $('<div class="fixed-top-shadow"></div>');
            fixedTopEmlnShadow.css({
                height: fixedTopElmn.outerHeight()
            });
            app.el['body'].prepend(fixedTopEmlnShadow);

            function fixedTopElmnSetFixed() {
                if(app.el['window'].scrollTop() > 0){
                    fixedTopElmn.addClass('fixed');
                }else{
                    fixedTopElmn.removeClass('fixed');
                }
            }
            fixedTopElmnSetFixed();

            app.el['window'].on('scroll', function(){
                debounce(fixedTopElmnSetFixed(), 250);
            });

        }

        //Scroll to ID
        $(".scroll-to").on("click", function( e ) {
            var offset = fixedTopElmn.outerHeight();
            e.preventDefault();
            $("body, html").animate({
                scrollTop: $( $(this).attr('href') ).offset().top - offset
            }, 750);
        });

        var headerNavElmn = $('#header-nav');
        headerNavElmn.singlePageNav({
            offset: fixedTopElmn.outerHeight(),
            filter: ':not(.external)',
            currentClass: 'active',
            changeHash: false,
            scrollSpeed: 750,
            scrollThreshold: 0.5,
            easing: 'swing'
        });

        //Animated appear
        app.el['animated'].appear(function() {
            var element = $(this);
            var animation = element.data('animation');
            var animationDelay = element.data('delay');
            if(animationDelay) {
                setTimeout(function(){
                    element.addClass( animation + " visible" );
                    element.removeClass('hiding');
                }, animationDelay);
            } else {
                element.addClass( animation + " visible" );
                element.removeClass('hiding');
            }
        }, {accY: -150});


        //Checkbox and Radio input style
        var icheckInputElmn = $('.icheck-input');
        icheckInputElmn.iCheck({
            labelHover: true,
            cursor: true,
            inheritClass: true
        });

        //Selectbox
        var selectBoxElmn = $('.selectbox');
        selectBoxElmn.each(function(){
            selectBoxElmn.select2({
                minimumResultsForSearch: Infinity,
                placeholder: $(this).data('placeholder'),
                width: '100%'
            });
        });

        $('.top-bar-menu-head button').on('click', function(e){
            $('.top-bar-menu-content').toggleClass('expanded')
        });

        $('.banner-slider').owlCarousel({
            items: 1,
            nav: false,
            dots: true
        });

        app.el['window'].on('load', function(){
            $('.partner-box').matchHeight()
        });

        var desktopHasSubMenu = $('.desktop-bottom-menu .has-sub-menu>a');
        var desktopSubMenuContainer = $('.desktop-sub-menu-wrapper');
        function openDesktopSubMenu(element){
            desktopHasSubMenu.addClass('open');
            var subMenuContent = element.closest('.has-sub-menu').find('.sub-menu').clone();
            desktopSubMenuContainer.html(subMenuContent);
            desktopSubMenuContainer.addClass('expanded');
        }
        function closeDesktopSubMenu(){
            desktopHasSubMenu.removeClass('open');
            desktopSubMenuContainer.removeClass('expanded');
        }

        // desktopHasSubMenu.on('click', function(e){
        //     if(!$(this).hasClass('open')){
        //         openDesktopSubMenu($(this));
        //         e.preventDefault();
        //     }else{
        //         closeDesktopSubMenu();
        //     }
        // });

        // app.el['window'].on('resize', function(){
        //     closeDesktopSubMenu();
        // });
        // app.el['window'].on('scroll', function(){
        //     closeDesktopSubMenu();
        // });

        var desktopFixedTop = $('.desktop-fixed-nav');
        if(desktopFixedTop.length){
            function desktopFixedTopElmnSetFixed() {
                if(app.el['window'].scrollTop() > 0){
                    desktopFixedTop.addClass('fixed');
                }else{
                    desktopFixedTop.removeClass('fixed');
                }
            }
            desktopFixedTopElmnSetFixed();

            app.el['window'].on('scroll', function(){
                debounce(desktopFixedTopElmnSetFixed(), 250);
            });

        }


        var subMenuToggle = $('.has-sub-menu>a');
        subMenuToggle.on('click', function(e){
            if(!$(this).hasClass('open')){
                e.preventDefault();
                $(this).addClass('open');
                $(this).closest('.has-sub-menu').find('.sub-menu').addClass('expanded');
            }else{
                $(this).removeClass('open');
                $(this).closest('.has-sub-menu').find('.sub-menu').removeClass('expanded');
            }
        });

        var mobileBottomMenu = $('.mobile-bottom-menu');

        $('.mobile-toggle').on('click', function(){
            $(this).closest('.mobile-nav').find('.mobile-bottom-menu').toggleClass('expanded')
        });

        app.el['window'].on('scroll', function(){
            mobileBottomMenu.removeClass('expanded')
        });

        var mobileFixedTop = $('.mobile-fixed-nav');
        if(mobileFixedTop.length){
            function mobileFixedTopElmnSetFixed() {
                if(app.el['window'].scrollTop() > 0){
                    mobileFixedTop.addClass('fixed');
                }else{
                    mobileFixedTop.removeClass('fixed');
                }
            }
            mobileFixedTopElmnSetFixed();

            app.el['window'].on('scroll', function(){
                debounce(mobileFixedTopElmnSetFixed(), 250);
            });

        }


    });

})(window.Zepto || window.jQuery, window, document);