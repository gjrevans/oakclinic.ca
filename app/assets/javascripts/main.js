/* -- PAGE JS --*/
$(document).ready(function(){
    $.backstretch([
        "http://dl.dropbox.com/u/515046/www/outside.jpg"
      , "http://dl.dropbox.com/u/515046/www/garfield-interior.jpg"
      , "http://dl.dropbox.com/u/515046/www/cheers.jpg"
    ], {duration: 3000, fade: 750});
    /*
    var index = 0;
    var colors = [
        '#971B4D',
        '#81C564',
        '#CF649A',
    ]
    var images = [
        'https://static.pexels.com/photos/375760/pexels-photo-375760.jpeg',
        'https://static.pexels.com/photos/302478/pexels-photo-302478.jpeg',
        'https://static.pexels.com/photos/27599/pexels-photo-27599.jpg',
    ]

    setInterval(function() {
        $('.l-home').css({
            '-webkit-transition': 'background-image 0.2s ease-in-out',
            'transition': 'background-image 0.2s ease-in-out',
            'background': 'linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),url('+images[index]+')',
            'background-size': 'cover',
            'background-position': 'center',
            'background-attachment': 'fixed',
            'background-repeat': 'no-repeat'
        });
        $('.btn-primary').css({
            'background': colors[index],
            'border-color': colors[index]
        });
        if (index === images.length - 1){
            return index = 0;
        }
        index += 1;
    }, 5000);
    */
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
    // Minipulate navigation style based on position
    $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll <= 100) {
            $(".m-nav__top").css("background", "none").removeClass("box-shadow");
            $(".m-nav__link a").css("color", "white");
            $(".m-nav__avatar img").css({
                "width": "4rem",
                "height": "4rem",
            });
        } else if (scroll >= 100) {
            $(".m-nav__top").css("background", "white").addClass("box-shadow");
            $(".m-nav__link a").css("color", "#03a9f4");
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
