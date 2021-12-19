class MaterialStockTable < ApplicationRecord
  belongs_to :user

  validates :material_name, presence: true, uniqueness: { scope: :user_id }
end
