class Admin::CategoriesController < ApplicationController
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to admin_category_words_url(@category)
    else
      render "new"
    end
  end

  def update
    @category = Category.find(params[:id])
      if @category.update(categories_params)
        redirect_to admin_categories _url 
      else
        render "edit"
      end
  end
# updateでは、editの要領で受け取った値を、updateで更新してしまう。


  def edit
    @category = Category.find(params[:id])
    # 編集するデータを探してくる
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  # edit.htmlで入力されて、fに代入されて@userあてに届いた値をparamsで選別、取得。それを元にデータを検索する。
  # ruting的に、自動でupdateメソッドにも飛んでいるので、editで取得した値はupdateで処理される。
  private
  def categories_params
    params.require(:category).permit(:title,:description)
  end
end
