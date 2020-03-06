class SessionsController < ApplicationController

  def login
    @users= User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to edit_user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end