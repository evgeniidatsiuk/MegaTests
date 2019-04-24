require 'test_helper'

class PostcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get postcomments_show_url
    assert_response :success
  end

end
