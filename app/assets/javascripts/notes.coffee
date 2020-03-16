$(document).on 'change', '#lecture_department_id', ->
  $.ajax(
    type: 'GET'
    url: '/notes/lecture_controller/get_departments'
    data: {
      faculty_id: $(this).val()
    }
  ).done (data) ->
    $('.department').html(data)

