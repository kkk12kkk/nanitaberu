require "test_helper"

class TaberusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taberus_new_url
    assert_response :success
  end

  test "should get index" do
    get taberus_index_url
    assert_response :success
  end

  test "should get show" do
    get taberus_show_url
    assert_response :success
  end

  test "should get edit" do
    get taberus_edit_url
    assert_response :success
  end
end
