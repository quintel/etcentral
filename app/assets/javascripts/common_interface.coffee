$ ->

class @AppInterface
  constructor: ->
    @setup_menus()

  setup_menus: =>
    # Expand menus
    #
    $("a.menu_toggler").click (e) =>
      e.preventDefault()
      is_open = $(e.target).hasClass('menu-open')
      @close_all_menus()
      if !is_open
        $(e.target).addClass('menu-open')
        $(e.target).parent().find('.header_menu').show()

    # Close menus when clicking outside them
    #
    $('body').mouseup (e) =>
      if $(e.target).closest(".header_menu").length == 0 &&
         !$(e.target).is('a.menu_toggler')
        @close_all_menus()

  close_all_menus: ->
    $('a.menu_toggler').removeClass('menu-open')
    $('.header_menu').hide()

$ ->
  window.Interface = new AppInterface()