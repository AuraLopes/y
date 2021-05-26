class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  #validates :rating, presence: true
  #validates :rating, numericality: (0..9)
  #validates :rating, inclusion: (0..5)
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
