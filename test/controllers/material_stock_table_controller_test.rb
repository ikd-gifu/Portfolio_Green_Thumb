require "test_helper"

class MaterialStockTableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get material_stock_table_index_url
    assert_response :success
  end

  test "should get new" do
    get material_stock_table_new_url
    assert_response :success
  end

  test "should get show" do
    get material_stock_table_show_url
    assert_response :success
  end
end
