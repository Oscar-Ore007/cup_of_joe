require 'test_helper'

class CoffeeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coffee_index_url
    assert_response :success
  end

  test "should get show" do
    get coffee_show_url
    assert_response :success
  end

end
