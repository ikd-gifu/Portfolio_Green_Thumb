require "test_helper"

class PlantManagementSlipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plant_management_slips_index_url
    assert_response :success
  end

  test "should get new" do
    get plant_management_slips_new_url
    assert_response :success
  end

  test "should get show" do
    get plant_management_slips_show_url
    assert_response :success
  end
end
