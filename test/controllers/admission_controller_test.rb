require 'test_helper'

class AdmissionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admission_index_url
    assert_response :success
  end

end
