# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Gets all the actions from selected controller.
$(window).bind 'page:change', ->
  initializeAnonymousButton = ->
    $('.anonymous-btt').on 'click', (event) ->
      changeAnonymousBttState $(this)
      event.stopImmediatePropagation()
      return
    return

  changeAnonymousBttState = (btt) ->
    check_box = $('#anonymous-check')
    if check_box.prop('checked')
      btt.removeClass('btn-info').addClass 'btn-default'
      check_box.prop 'checked', false
      $('#request_general_information_attributes_name').empty().attr('readonly', false)
      $('#request_general_information_attributes_father_last_name').empty().attr('readonly', false)
      $('#request_general_information_attributes_mother_last_name').empty().attr('readonly', false)
    else
      check_box.prop 'checked', true
      btt.removeClass('btn-default').addClass 'btn-info'
      $('#request_general_information_attributes_name').empty().attr('readonly', true)
      $('#request_general_information_attributes_father_last_name').empty().attr('readonly', true)
      $('#request_general_information_attributes_mother_last_name').empty().attr('readonly', true)
    return

  initializeAnonymousButton()
  return