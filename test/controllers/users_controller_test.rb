require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get follow" do
    get users_follow_url
    assert_response :success
  end

  test "should get unfollow" do
    get users_unfollow_url
    assert_response :success
  end
end
