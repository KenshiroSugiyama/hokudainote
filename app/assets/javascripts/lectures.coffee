# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#faculty', ->
  $.ajax(
    type: 'GET'
    url: '/notes/lectures/get_departments'
    data: {
      faculty_id: $(this).val()
    }
  ).done (data) ->
    $('#get_departments').html(data)