# Gets all the actions from selected controller.
$(window).bind 'page:change', ->
  $('#permission_controller').on 'change', ->
    resource = $('#permission_controller').val()
    url = $('#permission_controller').data('url')
    if resource
      $.get url, resource: resource
    else
      $('#permission_action').empty().append '<option>' + I18n.select + '</option>'
    return

  # When the Generate seeds button is clicked, makes an ajax request
  $('.generate-seed').on 'click', ->
    Metronic.blockUI
      boxed: true
      message: I18n.processing_message
    $.ajax
      url: '/permissions/generate_seeds'
      type: 'POST'
      dataType: 'json'
      success: ->
        if window.location.href.indexOf('?') > -1
          window.location.href = '/permissions#done'
        else
          window.location.href = '/permissions#done'
          location.reload()
        return
      error: ->
        return
    return

  # Displays a success message after the seeds were generated and refresh
  PermissionMessage = ->
    if window.location.hash == '#done'
      window.location.replace '#'
      if typeof window.history.replaceState == 'function'
        history.replaceState {}, '', window.location.href.slice(0, -1)
      toastr.info I18n.seeds_generated
    return

  PermissionMessage()
  return
