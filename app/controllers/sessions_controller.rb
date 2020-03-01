class SessionsController < ApplicationController
  require 'pry'
  def login
    @users= User.all
  end

  def new
    @user = User.new
  end

  def create_github # github
    @user = User.create_or_find_by(params[:id])
    client_id     = 'b412366a062e10790462'
    client_secret = '47187aa0cb5906e2ba8bb7f50aa168830d146d94'
    code          = params[:code]
    response      = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")

    pairs = response.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end

    token = response_hash["access_token"]

    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)

    user          = User.find_or_create_by(uid: auth["id"])
    user.username = auth["login"]
    # user.uid      = auth["id"]
    user.token    = token
    user.save

    session[:user_id] = user.id

    redirect_to root_path
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