class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = Activity.where("user_id = ?", @user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def update
    @user =User.find(params[:id])
    if @user.update(users_params)
      redirect_to current_user
    else
      render”edit”
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
  end

  private
  def users_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation,:picture)
  end
end