require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get ncreate" do
    get likes_ncreate_url
    assert_response :success
  end

  test "should get show" do
    get likes_show_url
    assert_response :success
  end

  test "should get destory" do
    get likes_destory_url
    assert_response :success
  end
end
