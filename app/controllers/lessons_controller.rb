class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
      # @categoryはCategoryモデルからpathされたcategory_idを探してきて代入する。
      # ex(apple category)
    @lesson = @category.lessons.new(user: current_user)
      # ログイン中のユーザーでcategoryを指定してlessonに代入する
      # (kenがapple categoryで@lessonを作成)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
      # @lessonを使ってanswerのnewにリダイレクト
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @category = @lesson.category
  end
end