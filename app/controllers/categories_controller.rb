class CategoriesController < ApplicationController
  def children
    @categories = Category.find(params[:id]).children
    respond_to do |format|
      format.json { render json: @categories }
    end
  end
end
