class ChangeDatatypeMaterialQuantityOfGardeningDiary < ActiveRecord::Migration[6.1]
  def change
    change_column :gardening_diaries, :material_consumption, :integer
  end
end
