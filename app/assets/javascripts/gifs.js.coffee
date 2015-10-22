$(document).ready ->
  console.log "doc ready"
  ready

$(document).on "page:load", ->
  console.log "page:load"
  ready

ready = ->
  $("a[data-id]").hover ((e) ->
    #gif_id = "#" + $(@).data("id")
    console.log "hovered"
    $(@).mousemove (e) ->
      $(@).parent().css({
        left: e.pageX + 9,
        top: e.pageY + 1
      }).show()
  ), ->
    $("#" + $(@).data("id")).parent().hide()

  $("#gif_tag_list").selectize
    delimiter: ',',
    persist: false,
    create: ((input) ->
      vaule: input,
      text: input
    )

