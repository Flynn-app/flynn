require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get profiles_profile_url
    assert_response :success
  end

end
