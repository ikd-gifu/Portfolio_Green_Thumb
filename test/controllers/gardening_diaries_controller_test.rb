require "test_helper"

class GardeningDiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gardening_diaries_index_url
    assert_response :success
  end

  test "should get show" do
    get gardening_diaries_show_url
    assert_response :success
  end

  test "should get new" do
    get gardening_diaries_new_url
    assert_response :success
  end
end
