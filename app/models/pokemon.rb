class Pokemon < ApplicationRecord
  validates :name, :specialty, :level, :weak_against, :strong_against, :image, presence: true

  validates :name, length: { mininum: 3 }
end
