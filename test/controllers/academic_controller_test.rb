require 'test_helper'

class AcademicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get academic_index_url
    assert_response :success
  end

end
