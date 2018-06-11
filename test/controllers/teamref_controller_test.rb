require 'test_helper'

class TeamrefControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get teamref_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teamref_destroy_url
    assert_response :success
  end

end
