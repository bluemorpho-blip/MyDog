class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    @user = current_user
    Pet.message
    redirect_to user_path(@user)
  end
end