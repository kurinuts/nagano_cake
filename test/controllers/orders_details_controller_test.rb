require "test_helper"

class OrdersDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_details_new_url
    assert_response :success
  end

  test "should get index" do
    get orders_details_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_details_show_url
    assert_response :success
  end

  test "should get edit" do
    get orders_details_edit_url
    assert_response :success
  end
end
