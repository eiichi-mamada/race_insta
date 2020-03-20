class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  belongs_to :area
  has_many :number_tags, dependent: :delete_all
  has_many :cars, through: :number_tags
  has_many :comments,  dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.search(search)
    # Post.where("area_id = #{search}")
    split_keywords = search.split(/[[:blank:]]+/)
    post_search = []
    split_keywords.each do |keyword|
      if keyword.slice(0,1) == "#"
        next if keyword.delete("#") == ""
        car = Car.find_by("car_number = #{keyword.delete("#")}")
        post_search += car.posts
      else
        next if keyword == ""
        post_search += Post.where("area_id = #{keyword}")
      end
    end
    post_search.uniq!
    return post_search
  end
end
