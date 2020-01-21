# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#lecture_faculty', ->
  $.ajax(
    type: 'GET'
    url: '/lectures/get_departments'
    data: {
      faculty: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_departments').html(data)

$('.get_departments').on 'change','#lecture_departments', ->
  $.ajax(
    type: 'GET'
    url: '/lectures/get_educators'
    data: {
      department: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_educators').html(data)