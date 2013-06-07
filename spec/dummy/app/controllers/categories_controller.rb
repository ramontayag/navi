class CategoriesController < ApplicationController
  respond_to :html

  def create
    @category = Category.create(params[:category])
    respond_with @category, location: categories_path
  end
end
