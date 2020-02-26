class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    @pet = Pet.find_by(params[:id])
    @user = @pet.user
    @med = params[:name]
    TwilioClient.new.send_text(@user, @pet, @med)
    redirect_to @pet
  end

end