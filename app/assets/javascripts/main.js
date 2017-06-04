/* -- PAGE JS --*/
$(document).ready(function(){
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
    // Minipulate navigation style based on position
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll <= 100) {
            $(".m-nav__top").css("background", "none").removeClass("box-shadow");
            $(".m-nav__logo").css("color", "#FFF");
            $(".m-nav__link a").css("color", "#FFF");
            $(".m-nav__avatar img").css({
                "width": "4rem",
                "height": "4rem",
            });
        } else if (scroll >= 100) {
            $(".m-nav__top").css("background", "white").addClass("box-shadow");
            $(".m-nav__logo").css("color", "#971B4D");
            $(".m-nav__link a").css("color", "#971B4D");
            $(".m-nav__avatar img").css({
                "width": "3rem",
                "height": "3rem",
            });
        }
    });

    // Show navigation on scroll
    var lastScrollTop = 0;
    $(window).scroll(function(event){
        var st = $(this).scrollTop();
        if (st > lastScrollTop){
            $(".nav__top").css("top", "-200px");
        } else {
            $(".nav__top").css("top", "0px");
        }
        lastScrollTop = st;
    });

    // Smooth Scrolling
    $(function() {
        $('a[href*="#"]:not([href="#"])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
});
