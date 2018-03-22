require 'test_helper'

class MgmttechControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mgmttech_index_url
    assert_response :success
  end

end
