require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get method_new" do
    get users_method_new_url
    assert_response :success
  end

end
