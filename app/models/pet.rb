class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :veterinarian
  has_many :meds

  validates :name, uniqueness: {scope: :user_id}

    account_sid = 'ACf6ddfec37ae5290c83a0f71e86a897d0'
    auth_token = 'a77ad101c3df70a73b64782f7e775023'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
                  .create(
                      body: "This is the ship that made the Kessel Run in fourteen parsecs?",
                      from: '+12672448354',
                      to: '+13862435991'
                  )

    puts message.sid

end