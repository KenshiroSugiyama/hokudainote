$(document).on 'change', '#user_profile_faculty', ->
  $.ajax(
    type: 'GET'
    url: '/user_profiles/get_departments'
    data: {
      faculty: $(this).val()
    }
  ).done (data) ->
    console.info(data)
    $('.get_departments').html(data)