require 'test_helper'

class AudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get audios_new_url
    assert_response :success
  end

  test "should get create" do
    get audios_create_url
    assert_response :success
  end

end
