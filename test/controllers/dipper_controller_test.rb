require 'test_helper'

class DipperControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get dipper_request_url
    assert_response :success
  end

  test "should get serverStatus" do
    get dipper_serverStatus_url
    assert_response :success
  end

  test "should get kill" do
    get dipper_kill_url
    assert_response :success
  end

end
