class CreateMaterialStockTables < ActiveRecord::Migration[6.1]
  def change
    create_table :material_stock_tables do |t|
      t.string :material_name
      t.integer :material_price
      t.string :material_size
      t.string :material_quantity
      t.datetime :material_purchase_date
      t.string :material_purchase_location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
