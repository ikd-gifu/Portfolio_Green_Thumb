class CreatePlantManagementSlips < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_management_slips do |t|
      t.string :plant_name
      t.integer :plant_price
      t.string :plant_size
      t.string :plant_quantity
      t.datetime :plant_purchase_date
      t.string :plant_purchase_location
      t.references :plant_basic_datum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
