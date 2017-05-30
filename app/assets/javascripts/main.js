/* -- PAGE JS --*/
$(document).ready(function(){
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
    // Minipulate navigation style based on position
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll <= 100) {
            $(".nav--top").css("background", "none").removeClass("box-shadow");
            $(".nav--link a").css("color", "white");
            $(".nav--avatar img").css({
                "width": "4rem",
                "height": "4rem",
            });
        } else if (scroll >= 100) {
            $(".nav--top").css("background", "white").addClass("box-shadow");
            $(".nav--link a").css("color", "#03a9f4");
            $(".nav--avatar img").css({
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
            $(".nav--top").css("top", "-200px");
        } else {
            $(".nav--top").css("top", "0px");
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
