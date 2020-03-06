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

  def create_stable
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end