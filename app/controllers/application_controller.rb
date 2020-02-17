class ApplicationController < ActionController::Base

  helper_method :current_owner
  helper_method :logged_in?

  private

  def authorize(owner = nil)
    if owner.nil?
      not_authorized("Login to view this page!") unless logged_in?
    else
      not_authorized unless owner == current_owner
    end
  end

  def authorize_admin
    authorize
    not_authorized("You must be an admin to view this page.") unless current_owner.admin
  end

  def current_owner_is?(user)
    owner == current_owner
  end

  def current_owner
    Owner.find_by(id: session[:owner_id])
  end

  def logged_in?
    !!current_owner
  end

  def not_authorized(msg = "You are not authorized to view this page.")
    flash[:alert] = msg
    redirect_to root_path
  end

end
