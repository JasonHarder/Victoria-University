require 'test_helper'

class InterestedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interested_index_url
    assert_response :success
  end

end
