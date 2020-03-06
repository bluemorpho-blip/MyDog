class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(pet_name, phone_number, med_name)
    client.api.account.messages.create(
        to: phone_number,
        from: twilio_phone_number,
        body: "#{pet_name}'s prescription for #{med_name} is ready for pick up"
    )
  end

  private

  def account_sid
    ENV["account_sid"]
  end

  def auth_token
    ENV["auth_token"]
  end

  def twilio_phone_number
    ENV["twilio_phone_number"]
  end

end