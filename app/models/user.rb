class User < ApplicationRecord
  has_secure_password

  has_many :pets, :dependent => :destroy
  has_many :veterinarians, through: :pets
  has_many :meds, :dependent => :destroy

  # validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        password: SecureRandom.urlsafe_base64,
        #email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token],
        oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
