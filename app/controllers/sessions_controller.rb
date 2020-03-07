class SessionsController < ApplicationController

  def login
    @users= User.all
  end

  def create_login_session
    if (user = User.find_by(user_params(:id)))
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome, #{user.name}"
      else
        flash[:message] = "improper credentials entered"
        @users = User.all
        render 'login'
      end
    else
      flash[:message] = "user not found"
      @users = User.all
      render 'login'
    end
  end

  def create #Oauth session
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

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end