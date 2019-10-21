class AnswersController < ApplicationController
  def new
    # ---@lessonのデータのidがparamsとして送られてきている状態----
    @lesson = Lesson.find(params[:lesson_id])
    # @lessonはLessonモデルでidに紐づいたLessonカラムを探してきて代入する
    @category = Category.find(@lesson.category_id)
    #@categoryは、idに紐づけされたlessonカラムのcategory_idに紐づいたカテゴリーモデルを探してきて代入する

    if @lesson.next_word.nil?
      redirect_to @lesson
      # 単語がゼロになったら、lesson show pageにリダイレクト
    else
      @answer = @lesson.answers.new
      # 単語がゼロじゃなかったら、もう一回newメソッドを繰り返し
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    # レッスンを指定
    @answer = @lesson.answers.new(answer_params)
    # ここでlessonに紐づいたAnswerデータができる。
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