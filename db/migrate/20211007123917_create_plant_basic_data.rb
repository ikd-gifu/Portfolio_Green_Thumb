class CreatePlantBasicData < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_basic_data do |t|
      t.string :plant_name
      t.string :plant_breed_name
      t.string :plant_family_name
      t.string :plant_alias
      t.string :plant_scientific_name
      t.string :plant_place_of_origin
      t.text :characteristics_applications
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
