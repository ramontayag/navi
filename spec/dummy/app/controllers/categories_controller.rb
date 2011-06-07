class CategoriesController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html {redirect_to categories_url}
    end
  end
end
