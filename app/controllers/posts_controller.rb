class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
  end

end
