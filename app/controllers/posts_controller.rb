class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user.id == @post.user_id || current_user.admin
    else
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @post.user_id || current_user.admin
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    permitted_params = params.require(:post).permit(:title, :explanation, :image, :category_id, member_ids: [])
    
    # 管理者の場合はuser_idを更新しない
    permitted_params = permitted_params.merge(user_id: current_user.id) unless current_user.admin?
    
    permitted_params
  end

  def set_post
    @post = Post.find(params[:id])
  end
end