class PlantBasicDatum < ApplicationRecord
  belongs_to :user
  has_many :plant_management_slips
end
