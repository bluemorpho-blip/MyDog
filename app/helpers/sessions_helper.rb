module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:owner_id] = owner.id
  end
end