class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
                                                                  # @categoryには,レッスン一覧画面(category index page)でpathされたcategory_idに対応したレコードでインスタンスを作る。
  
                                                                  # ----ここ以下は、category_indexでクリックしたcategoryについてのデータ-------
     
      @lesson = @category.lessons.new(user: current_user)
                                                                  # 指定されているcategoryで新しいlessonインスタンスを作る。そこのuser_idにはログイン中のユーザーの物を指定。
                                                                  # (kenがapple categoryで@lessonを作成)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
                                                                  # @lessonを使ってanswer controllerのnew actionにリダイレクト(@lessonを乗せて)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @category = @lesson.category
    
                                                                   # @word = @category.word
  end
end