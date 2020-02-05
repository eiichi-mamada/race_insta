class AreasController < ApplicationController
  def show
     @area_posts = Post.find_by(area: 1)
  end
end
