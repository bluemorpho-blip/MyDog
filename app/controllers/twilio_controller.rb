class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    @pet = Pet.find_by(params[:id])
    @user = @pet.user
    TwilioClient.new.send_text(@user, @pet)
    redirect_to @pet
  end

end