require 'test_helper'

class BrokersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brokers_index_url
    assert_response :success
  end

  test "should get new" do
    get brokers_new_url
    assert_response :success
  end

  test "should get show" do
    get brokers_show_url
    assert_response :success
  end

  test "should get destroy" do
    get brokers_destroy_url
    assert_response :success
  end

end
