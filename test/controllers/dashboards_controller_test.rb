require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get dashboards_profile_url
    assert_response :success
  end

end
