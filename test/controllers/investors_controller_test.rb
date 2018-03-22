require 'test_helper'

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investors_index_url
    assert_response :success
  end

end
