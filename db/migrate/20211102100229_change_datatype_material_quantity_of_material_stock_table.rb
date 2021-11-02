class ChangeDatatypeMaterialQuantityOfMaterialStockTable < ActiveRecord::Migration[6.1]
  def change
    change_column :material_stock_tables, :material_quantity, :integer
  end
end
