class AddPlantIndividualNameToGardeningDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :gardening_diaries, :plant_individual_name, :string
  end
end
