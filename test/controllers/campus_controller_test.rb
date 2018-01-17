require 'test_helper'

class CampusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campus_index_url
    assert_response :success
  end

end
