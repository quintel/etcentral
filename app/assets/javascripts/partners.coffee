$ ->
  $(".partner_link").mousemove (e) ->
    offset = $("#partners").offset()
    top = e.pageY - offset.top + 10
    left = e.pageX - offset.left + 10
    id = $(this).attr("rel")
    $("##{id}_description").css({"top": top, "left": left})

  $(".partner_link").hover( ->
      $("##{$(this).attr("rel")}_description").show()
    , ->
      $("##{$(this).attr("rel")}_description").hide()
  )
