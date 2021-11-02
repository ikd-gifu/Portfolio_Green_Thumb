class AddCultivationPlaceToPlantManagementSlips < ActiveRecord::Migration[6.1]
  def change
    add_column :plant_management_slips, :cultivation_place, :string
  end
end
