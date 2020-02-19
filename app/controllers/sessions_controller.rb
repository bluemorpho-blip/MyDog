class SessionsController < ApplicationController

  def login
    @users= User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end