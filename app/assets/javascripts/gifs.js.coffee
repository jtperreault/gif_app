$(document).ready ->
  apply_preview_hover()

$(document).on "page:load", ->
  apply_preview_hover()


apply_preview_hover = ->

  $("a[data-id]").hover ((e) ->
    preview = $("div[data-preview-id=#{$(@).data('id')}]")

    $(@).mousemove (e) ->

      $(preview).css({
        left: e.pageX + 9,
        top: e.pageY + 1
      }).show()

  ), ->

    $( "#" + $(@).data("id") ).parent().hide()
