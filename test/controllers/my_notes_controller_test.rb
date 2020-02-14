require 'test_helper'

class MyNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get my_notes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get my_notes_destroy_url
    assert_response :success
  end

end
