require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get readings_index_url
    assert_response :success
  end

  test "should get show" do
    get readings_show_url
    assert_response :success
  end

  test "should get new" do
    get readings_new_url
    assert_response :success
  end

end
