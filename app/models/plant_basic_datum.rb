class PlantBasicDatum < ApplicationRecord
  belongs_to :user
  has_many :plant_management_slips

  validates :plant_name, presence: true
end
