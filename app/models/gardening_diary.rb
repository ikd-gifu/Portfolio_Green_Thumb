class GardeningDiary < ApplicationRecord
  belongs_to :user

  validates :work_name, presence: true
end
