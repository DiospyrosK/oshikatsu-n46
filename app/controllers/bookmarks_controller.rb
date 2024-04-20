class BookmarksController < ApplicationController
  before_action :set_post

  def create
    @bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    if @bookmark.save
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id], post_id: params[:post_id], user_id: current_user.id)
    if @bookmark.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
