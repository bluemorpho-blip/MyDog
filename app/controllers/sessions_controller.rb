class SessionsController < ApplicationController

  def login
    @owners = User.all
  end

  def create
    if (owner = User.find_by(owner_params(:id)))
      if owner.authenticate(params[:owner][:password])
        session[:owner_id] = owner_id
        flash[:message] = "Welcome, #{owner.name}"
        redirect_to owner_path(owner)
      else
        flash[:message] = "Improper Credentials Entered."
        @owners = User.all
        render 'login'
      end
    else
      flash[:message] = "User not found."
      @owners = User.all
      render 'login'
    end
  end

  def destroy
    session.delete(:owner_id)
    @current_owner = nil
    redirect_to root_path
  end

  private

  def owner_params(*args)
    params.require(:owner).permit(*args)
  end

end