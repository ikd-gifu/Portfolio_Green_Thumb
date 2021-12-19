class PlantBasicDatum < ApplicationRecord
  belongs_to :user
  has_many :plant_management_slips, dependent: :destroy

  validates :plant_name, presence: true, uniqueness: { scope: :user_id }
end
