class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end
  
  def create
    binding.pry
    Post.create(post_params)
    redirect_to current_user
  end


  private
  def post_params
    params.permit(:image, :text, :car_number, :area_number)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
