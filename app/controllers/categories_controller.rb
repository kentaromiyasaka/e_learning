class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def learned

  end

  def not_learned

  end
end