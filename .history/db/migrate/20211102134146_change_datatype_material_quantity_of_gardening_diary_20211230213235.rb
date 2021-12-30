class ChangeDatatypeMaterialQuantityOfGardeningDiary < ActiveRecord::Migration[6.1]
  def change
    # MySQL
    #change_column :gardening_diaries, :material_consumption, :integer
    # PostgreSQL
    change_column :gardening_diaries, :material_consumption, 'integer USING CAST(material_consumption AS integer)'
  end
end
