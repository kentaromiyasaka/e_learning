class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @static_pages = Activity.where("user_id = ? OR user_id IN (?)", current_user.id, current_user.following.ids)
     # activityの中のuser_id =?　の意味は？また、(?)の意味は？
      .order(created_at: :desc).paginate(page: params[:page], per_page: 6)
      # created_at カラムで降順に並べ替え
      render "users/dash_board"
    end
  end


end
