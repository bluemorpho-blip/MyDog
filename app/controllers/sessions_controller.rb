class SessionsController < ApplicationController

  def login
    @users = User.all
  end

  def new
    @user = User.find_by(params[:id])
  end

  def create_login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def create #Oauth session
    user = User.update_or_create(request.env["omniauth.auth"])
      session[:id] = user.id
      redirect_to edit_user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end