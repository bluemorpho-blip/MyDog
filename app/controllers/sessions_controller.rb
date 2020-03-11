class SessionsController < ApplicationController

  def login
    @users = User.all
  end

  def new
    @user = User.find_by(params[:id])
  end

  def new_vet
    @vet = Veterinarian.find_by(params[:id])
  end

  def create_login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "successfully signed in as #{user.email}"
    else
      redirect_to signin_path, alert: 'incorrect email and/or password, try signing in with Google then updating your account'
    end
  end

  def create #Oauth session
    user = User.update_or_create(request.env["omniauth.auth"])
      session[:user_id] = user.id
    redirect_to root_path, notice: "successfully signed in with Google as #{user.email}"
      # redirect_to edit_user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end