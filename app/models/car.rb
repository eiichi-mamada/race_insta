class Car < ApplicationRecord
  has_many :number_tags
  has_many :posts, through: :number_tags
  validates :car_number, presence: true, uniqueness: true
end
