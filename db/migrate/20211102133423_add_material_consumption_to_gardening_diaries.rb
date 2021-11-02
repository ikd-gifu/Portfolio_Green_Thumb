class AddMaterialConsumptionToGardeningDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :gardening_diaries, :material_consumption, :string
  end
end
