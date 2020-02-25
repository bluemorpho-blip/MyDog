class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
  end
end