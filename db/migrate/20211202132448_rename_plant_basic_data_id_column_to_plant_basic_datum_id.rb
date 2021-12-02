class RenamePlantBasicDataIdColumnToPlantBasicDatumId < ActiveRecord::Migration[6.1]
  def change
    rename_column :gardening_diaries, :plant_basic_data_id, :plant_basic_datum_id
  end
end
