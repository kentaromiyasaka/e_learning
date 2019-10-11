class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin,true)
    redirect_to admin_users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin,false)
    redirect_to admin_users_url
  end

end