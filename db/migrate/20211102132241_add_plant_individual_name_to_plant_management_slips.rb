class AddPlantIndividualNameToPlantManagementSlips < ActiveRecord::Migration[6.1]
  def change
    add_column :plant_management_slips, :plant_individual_name, :string
  end
end
