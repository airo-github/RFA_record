require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get static_pages_top_url
    assert_response :success
  end

  test "should get before_login" do
    get static_pages_before_login_url
    assert_response :success
  end

  test "should get after_login" do
    get static_pages_after_login_url
    assert_response :success
  end
end
