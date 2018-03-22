require 'test_helper'

class NaturalappliedsciControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get naturalappliedsci_index_url
    assert_response :success
  end

end
