# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#note_faculty', ->
  $.ajax(
    type: 'GET'
    url: '/lectures/get_departments'
    data: {
      faculty: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_departments').html(data)

$(document).on 'change','#lectures_path_department_id', ->
  $.ajax(
    type: 'GET'
    url: '/lectures/get_educators'
    data: {
      department_id: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_educators').html(data)

$(document).on 'change','#lectures_path_educator', ->
  $.ajax(
    type: 'GET'
    url: '/lectures/get_lectures'
    data: {
      educator: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_lectures').html(data)