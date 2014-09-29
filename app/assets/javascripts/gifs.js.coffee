$ ->
  $("a[data-id]").hover ((e) ->
    gif_id = "#" + $(this).data("id")

    $(this).mousemove (e) ->
      $(gif_id).parent().css({
        left: e.pageX + 9,
        top: e.pageY + 1
      }).show();
  ), ->
    $("#" + $(this).data("id")).parent().hide();

