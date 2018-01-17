require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get conversations_create_url
    assert_response :success
  end

  test "should get add_to_conversations" do
    get conversations_add_to_conversations_url
    assert_response :success
  end

  test "should get conversated?" do
    get conversations_conversated?_url
    assert_response :success
  end

end
