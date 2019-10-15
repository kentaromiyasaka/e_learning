class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.new
    3.times { @word.choices.new }
    # 3回@wordのchoiceを繰り返します

  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(words_params)
    if @word.save
      redirect_to admin_category_url(@category)
    else
      render "new"
    end
    
  end

  private
  def words_params
    params.require(:word).permit(:content, choices_attributes:[:id, :content, :is_correct])
  end

end