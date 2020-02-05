class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  belongs_to :area

  mount_uploader :image, ImageUploader
end
