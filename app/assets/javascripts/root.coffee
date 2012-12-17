$ ->
  $(".screenshot, .product").hover (->
    this_id = $(this).attr("id")
    $("#products #" + this_id).addClass "active-product"
    $("#screenshots #" + this_id).addClass "active-screenshot"
  ), ->
    this_id = $(this).attr("id")
    $("#products #" + this_id).removeClass "active-product"
    $("#screenshots #" + this_id).removeClass "active-screenshot"