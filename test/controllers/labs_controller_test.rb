require 'test_helper'

class LabsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get labs_index_url
    assert_response :success
  end

end
