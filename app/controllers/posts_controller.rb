class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

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
    return unless current_user.id != @post.user_id
    redirect_to root_path
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :explanation, :image, :category_id, member_ids: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end