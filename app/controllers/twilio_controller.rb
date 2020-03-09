class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    pet = params[:pet_id]
    pet_name = params[:pet_name]
    phone_number = params[:phone_number]
    med_name = params[:med_name]
    TwilioClient.new.send_text(pet_name, phone_number, med_name)
    redirect_to users_path
  end

end