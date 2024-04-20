class BookmarksController < ApplicationController
  before_action :set_post

  def create
    bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    bookmark.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    bookmark = Bookmark.find_by(post_id: params[:post_id], user_id: current_user.id)
    bookmark.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
