class ChangeDatatypeMaterialQuantityOfMaterialStockTable < ActiveRecord::Migration[6.1]
  def change
    # MySQL
    # change_column :material_stock_tables, :material_quantity, :integer
    # PostgreSQL
    change_column :material_stock_tables, :material_quantity, 'integer USING CAST(material_quantity AS integer)'
  end
end
