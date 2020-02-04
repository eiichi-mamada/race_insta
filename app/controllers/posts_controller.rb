class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end
  
  def create
    Post.create(post_params)
    redirect_to current_user, notice: '投稿されました'
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to current_user, notice: '投稿が削除されました'
  end


  private
  def post_params
    params.permit(:image, :text, :car_number, :area_number).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
