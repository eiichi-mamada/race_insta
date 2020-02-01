class Post < ApplicationRecord
  validates :image, presence: true
  has_many :users

  mount_uploader :image, ImageUploader
end
