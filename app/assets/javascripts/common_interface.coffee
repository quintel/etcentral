$ ->

class @AppInterface
  constructor: ->
    @setup_menus()

  setup_menus: =>
    # Expand menus
    #
    $("a.menu_toggler").click (e) =>
      e.preventDefault()
      $t = $(e.target)
      is_open = $t.hasClass('menu-open')
      @close_all_menus()
      if !is_open
        $t.addClass('menu-open')
        $t.parent().find('.header_menu').show()

    # Close menus when clicking outside them
    #
    $('body').mouseup (e) =>
      $t = $(e.target)
      if $t.closest(".header_menu").length == 0 &&
         !$t.is('a.menu_toggler')
        @close_all_menus()

  close_all_menus: ->
    $('a.menu_toggler').removeClass('menu-open')
    $('.header_menu').hide()

$ ->
  window.Interface = new AppInterface()