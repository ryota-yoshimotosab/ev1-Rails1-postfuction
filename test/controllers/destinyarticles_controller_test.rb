require 'test_helper'

class DestinyarticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get destinyarticles_index_url
    assert_response :success
  end

  test "should get new" do
    get destinyarticles_new_url
    assert_response :success
  end

  test "should get edit" do
    get destinyarticles_edit_url
    assert_response :success
  end

  test "should get show" do
    get destinyarticles_show_url
    assert_response :success
  end

end
