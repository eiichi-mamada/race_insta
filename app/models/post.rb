class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  belongs_to :area
  mount_uploader :image, ImageUploader

  def self.search(search)
    Post.where("area_id = #{search}")
  end
end
