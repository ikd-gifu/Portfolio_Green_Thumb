class AddLocationIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location_id, :string, default: 1850147
  end
end
