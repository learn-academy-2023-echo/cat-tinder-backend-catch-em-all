class Pokemon < ApplicationRecord
  validates :name, :specialty, :level, :weak_against, :strong_against, :image, :enjoys, presence: true

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :enjoys, length: { minimum: 10 }
end
