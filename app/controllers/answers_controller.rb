class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    # @lessonはLessonモデルでidに紐づいたLessonカラムを探してきて代入する
    @category = Category.find(@lesson.category_id)
    #@categoryは、idに紐づけされたlessonカラムのcategory_idに紐づいたカテゴリーモデルを探してきて代入する

    if @lesson.next_word.nil?
      redirect_to @lesson
    else
      @answer = @lesson.answers.new
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    else
      render "new"
    end

  end

  private
  def answer_params
    params.require(:answer).permit(:lesson_id,:word_id,:choice_id)
  end

end