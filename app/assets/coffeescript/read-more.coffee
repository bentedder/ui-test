$ ->

     # define private LP object
      LP = {}

      # add property of readmore
      LP.readmore =
        
        # set initial and max heights
        initialHeight: 400
        maxHeight: 1600
        
        # master "toggle" function to be called from any link
        toggle: (e) ->
          e.preventDefault()
          linkTarget = $(e.currentTarget)
          target = linkTarget.prev(".content")
          if target.hasClass("open")
            LP.readmore.collapse target
            linkTarget.text "Read more"
          else
            LP.readmore.expand target
            linkTarget.text "Read less"
          return

        
        # separate out and anonymize expand function
        expand: (el) ->
          self = this
          el.removeClass("closed").addClass("open")
            .animate({
              height: self.maxHeight        
            }, 500)
          return

        
        # separate out and anonymize collapse function
        collapse: (el) ->
          self = this
          el.removeClass("open")
            .addClass("closed")
            .animate({
            height: self.initialHeight

          }, 500)
          return

      
      # add lightbox property to LP
      LP.lightbox =
        
        # master "open" call for images
        open: (e) ->
          imgSrc = e.currentTarget.src
          lb = LP.lightbox.create(imgSrc)
          $("body").append lb
          return
        
        # create new lightbox window
        create: (imgSrc) ->
          image = undefined
          lbContainer = undefined
          image = $("<img/>").addClass("lightboxImage").attr(
            class: "lightboxImage"
            src: imgSrc
          )
          
          # put together the lightbox and attach a click listener
          lbContainer = $("<div/>").addClass("lightbox").append(image).on("click", LP.lightbox.close)
          lbContainer

        
        # separate and anonymize the close call
        close: ->
          $(".lightbox").remove()
          return

      # handle the mobile nav menu
      LP.menu =

        # toggle on click
        toggle: (e) ->
          e.preventDefault()
          menu = $("nav.navigation")
          console.log(menu)
          if menu.hasClass("open")
            LP.menu.close menu
          else
            LP.menu.open menu
          return

        # open menu
        open: (el) ->
          el.removeClass("closed").addClass("open")
          return

        # close menu
        close: (el) ->
          el.removeClass("open").addClass("closed")
          return

      # functions and listeners to call on initialization
      LP.init = ->
        
        # toggle "Read More" on button click
        $("a.button").on "click", LP.readmore.toggle
        
        # toggle "Lightbox" on image click
        $(".images-container").on "click", "img", LP.lightbox.open

        # listen for toggle click
        $("a.menutab").on "click", LP.menu.toggle

        return

      # initialize LP object
      LP.init()
