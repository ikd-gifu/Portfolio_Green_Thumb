class CreateCurrentWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :current_weathers do |t|
      t.string :weather_main
      t.string :weather_description
      t.string :weather_icon
      t.integer :weather_id
      t.float :temp
      t.float :temp_max
      t.float :temp_min
      t.integer :humidity
      t.integer :pressure
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
