class SessionsController < ApplicationController



  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

end
