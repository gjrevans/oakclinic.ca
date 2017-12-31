/* -- PAGE JS --*/
$(document).on('turbolinks:load', function() {
  // Replace Feather Icons
  feather.replace();

  // Replace SVG images with inline SVGs
  $('img').filter(function() { return this.src.match(/.*\.svg$/); }).replaceSVG();

  // Enable Bootstrap Popovers
  $(function () {
    $('[data-toggle="popover"]').popover();
  });

  // Toggle navigation
  $('.js-toggle-navigation').on('click', function() {
    $('.l-navigation').toggleClass('d-flex');
  });

  // Minipulate navigation style based on position
  $(window).scroll(function(){
    var scroll = $(window).scrollTop();
    if (scroll <= 100) {
      $(".m-nav").removeClass("m-nav--inverse");
    } else if (scroll >= 100) {
      $(".m-nav").addClass("m-nav--inverse");
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

/**
*  JS SVG Image Replace
*  Replace all SVG images with inline SVGs
* *
*  @author      Gordon Evans
*  @copyright   Copyright (c) 2017
*  @since       Version 1.0.0
*
*/

(function($) {
  $.fn.replaceSVG = function(options) {

    return $(this).each(function() {
      var $img     = $(this),
          imgID    = $img.attr('id'),
          imgClass = $img.attr('class'),
          imgURL   = $img.attr('src');

      $.get(imgURL, function(data) {
        // Get the SVG tag, ignore the rest
        var $svg = $(data).find('svg');

        // Add replaced image's ID to the new SVG
        if (typeof imgID !== 'undefined') { $svg = $svg.attr('id', imgID); }

        // Add replaced image's classes to the new SVG
        if (typeof imgClass !== 'undefined') { $svg = $svg.attr('class', imgClass+' replaced-svg'); }

        // Remove any invalid XML tags as per http://validator.w3.org
        $svg = $svg.removeAttr('xmlns:a');

        // Replace image with new ibline SVG
        $img.replaceWith($svg);
      }, 'xml');
    });
  };
}(jQuery));
