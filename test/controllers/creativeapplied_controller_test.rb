require 'test_helper'

class CreativeappliedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creativeapplied_index_url
    assert_response :success
  end

end
