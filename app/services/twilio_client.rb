class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(user, pet, med)
    client.api.account.messages.create(
        to: user.phone_number,
        from: twilio_phone_number,
        body: "#{pet.name}'s prescription for #{med} is ready for pick up"
    )
  end


  private


  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def twilio_phone_number
    Rails.application.credentials.twilio[:twilio_phone_number]
  end

end