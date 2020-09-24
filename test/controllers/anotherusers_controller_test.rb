require 'test_helper'

class AnotherusersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get anotherusers_show_url
    assert_response :success
  end

end
