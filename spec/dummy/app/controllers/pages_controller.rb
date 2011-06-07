class PagesController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html {redirect_to pages_path}
    end
  end
end
