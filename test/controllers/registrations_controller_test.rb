require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get limit_users_registered" do
    get registrations_limit_users_registered_url
    assert_response :success
  end

end
