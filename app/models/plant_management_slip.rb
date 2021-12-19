class PlantManagementSlip < ApplicationRecord
  belongs_to :plant_basic_datum

  validates :plant_individual_name, presence: true, uniqueness: { scope: :plant_basic_datum_id }
end
