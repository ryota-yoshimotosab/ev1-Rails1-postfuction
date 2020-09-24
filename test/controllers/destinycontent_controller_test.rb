require 'test_helper'

class DestinycontentControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get destinycontent_top_url
    assert_response :success
  end

  test "should get story" do
    get destinycontent_story_url
    assert_response :success
  end

  test "should get character" do
    get destinycontent_character_url
    assert_response :success
  end

end
