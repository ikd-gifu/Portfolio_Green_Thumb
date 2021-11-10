require "test_helper"

class PlantBasicDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plant_basic_data_index_url
    assert_response :success
  end
end
