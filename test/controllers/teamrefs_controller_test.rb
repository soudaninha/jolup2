require 'test_helper'

class TeamrefsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get teamrefs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teamrefs_destroy_url
    assert_response :success
  end

end
