(function() {
  $(function() {
    var LP;

    LP = {};
    LP.readmore = {
      initialHeight: 400,
      maxHeight: 1600,
      toggle: function(e) {
        var linkTarget, target;

        e.preventDefault();
        linkTarget = $(e.currentTarget);
        target = linkTarget.prev(".content");
        if (target.hasClass("open")) {
          LP.readmore.collapse(target);
          linkTarget.text("Read more");
        } else {
          LP.readmore.expand(target);
          linkTarget.text("Read less");
        }
      },
      expand: function(el) {
        var self;

        self = this;
        el.removeClass("closed").addClass("open").animate({
          height: self.maxHeight
        }, 500);
      },
      collapse: function(el) {
        var self;

        self = this;
        el.removeClass("open").addClass("closed").animate({
          height: self.initialHeight
        }, 500);
      }
    };
    LP.lightbox = {
      open: function(e) {
        var imgSrc, lb;

        imgSrc = e.currentTarget.src;
        lb = LP.lightbox.create(imgSrc);
        $("body").append(lb);
      },
      create: function(imgSrc) {
        var image, lbContainer;

        image = void 0;
        lbContainer = void 0;
        image = $("<img/>").addClass("lightboxImage").attr({
          "class": "lightboxImage",
          src: imgSrc
        });
        lbContainer = $("<div/>").addClass("lightbox").append(image).on("click", LP.lightbox.close);
        return lbContainer;
      },
      close: function() {
        $(".lightbox").remove();
      }
    };
    LP.menu = {
      toggle: function(e) {
        var menu;

        e.preventDefault();
        menu = $("nav.navigation");
        console.log(menu);
        if (menu.hasClass("open")) {
          LP.menu.close(menu);
        } else {
          LP.menu.open(menu);
        }
      },
      open: function(el) {
        el.removeClass("closed").addClass("open");
      },
      close: function(el) {
        el.removeClass("open").addClass("closed");
      }
    };
    LP.init = function() {
      $("a.button").on("click", LP.readmore.toggle);
      $(".images-container").on("click", "img", LP.lightbox.open);
      $("a.menutab").on("click", LP.menu.toggle);
    };
    return LP.init();
  });

}).call(this);
