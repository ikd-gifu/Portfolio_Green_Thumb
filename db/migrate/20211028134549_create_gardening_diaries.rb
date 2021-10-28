class CreateGardeningDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :gardening_diaries do |t|
      t.string :work_name
      t.datetime :implementation_date
      t.text :work_content
      t.string :plant_name
      t.integer :plant_basic_data_id
      t.string :material_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
