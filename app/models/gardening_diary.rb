class GardeningDiary < ApplicationRecord
  belongs_to :user

  validates :work_name, presence: true

  def self.search(search)
    if search
      where(["work_name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
