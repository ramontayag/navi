class PagesController < ApplicationController
  respond_to :html

  def create
    @page = Page.create(params[:page])
    respond_with @page, location: pages_path
  end
end
