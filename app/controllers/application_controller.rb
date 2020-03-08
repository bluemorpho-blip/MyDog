class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize, only: [:edit]
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index]

  helper_method :current_user
  helper_method :logged_in?

  private

  def authorize(user = nil)
    if user.nil?
      not_authorized("Login to view this page!") unless logged_in?
    else
      not_authorized("Login to view this page!") unless current_user
    end
  end

  def authorize_admin
    authorize
    not_authorized("You must be an admin to view that page.") unless current_user.admin
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      render root_path, notice: "You must be logged in to access this section"
    end
  end

  def logged_in?
    !!current_user
  end

  def not_authorized(msg)
    redirect_to root_path notice: msg and return
  end

end
