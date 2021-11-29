class MaterialStockTable < ApplicationRecord
  belongs_to :user

  validates :material_name, presence: true
end
