class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @posts = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to current_user, notice: '投稿されました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end
  
  def edit
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.remove_image!
    post.destroy
    redirect_to current_user, notice: '投稿が削除されました'
  end

  def search
    redirect_to root_path if params[:keyword] == ""

    # @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(6)
    posts = Post.order("created_at DESC")
    @posts = posts.search(params[:keyword])
  end


  private
  def post_params
    params.require(:post).permit(:image, :text, :area_id, car_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
