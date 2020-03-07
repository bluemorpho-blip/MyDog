class SessionsController < ApplicationController

  def login
    @users= User.all
  end

  def new
    @user = User.new
  end

  def create_login_session
    user = User.find_or_create_by(params[:id])
    session[:id] = user.id
    redirect_to user_path(user)
  end

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    if user.persisted?
      session[:id] = user.id
      redirect_to edit_user_path(user)
    else
      redirect_to signup_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end