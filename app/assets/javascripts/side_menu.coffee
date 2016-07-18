# Shows as active the selected side menu option.
$(window).bind 'page:change', ->
  setHome = ->
    $('#home').addClass 'active-menu active open'
    return

  try
    controlView = $('#menu-active').data('controller').split("/")[0]
    if $('.' + controlView).length == 0
      setHome()
    else
      $('.' + controlView).addClass 'active-menu active open'
  catch _error
    setHome()
  return
