$ ->
  if $.browser.msie
    # A 1px increase fixes some bad aliasing when resizing the image down
    # to non-HiDPI resolutions.
    $('#header_inside img[src$="@2x.png"]').attr(width: '401')


  # information menu
  #
  $("a.information").click (e) ->
    e.preventDefault()
    $("#information_menu").toggle()
    $(".information").toggleClass("menu-open")
  # close when the user clicks outside the popup
  $(document).mouseup (e) ->
    if $(e.target).parents("#information_menu").length == 0
      $(".information").removeClass("menu-open")
      $("#information_menu").hide()

  # Menu items
  #

  $("#disable_peak_load_tracking").live 'click', -> disable_peak_load_tracking()

  # locale select box
  $("select#locale").change ->
    $.ajax
      url: "/set_locale"
      method: "PUT"
      data:
        locale: $(this).val()
      success: -> window.location.reload()




