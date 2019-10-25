class WordsController < ApplicationController
  def index
    if params[:category]
      @category = Category.find(params[:category])
      @answers = @category.answers
      @words = @answers.paginate(page: params[:page], per_page: 6)
    else
      @answers = current_user.answers
      @words = @answers.paginate(page: params[:page], per_page: 6)
    end
    @categories = current_user.categories.left_outer_joins(:lessons).where.not(lessons:{result: nil})
  end
end
