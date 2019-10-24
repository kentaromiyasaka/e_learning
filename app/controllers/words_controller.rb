class WordsController < ApplicationController
  def index
    @words = Word.all.paginate(page: params[:page], per_page: 6)
  end
end
