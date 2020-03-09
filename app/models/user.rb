class User < ApplicationRecord
  has_secure_password

  has_many :pets, :dependent => :destroy
  has_many :veterinarians, through: :pets
  has_many :meds, :dependent => :destroy

  # validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true
  validates :contact_method, presence: true

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        # password: SecureRandom.urlsafe_base64,
        # not updating pw stops it from being reset
        # every time a user signs in with Google
        # email: auth[:info][:email],
        # allow the user to set a preferred email
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

  def self.search(search)
    if search
      owner_name = User.find_by(last_name: search)
      if owner_name
        self.where(id: owner_name)
      else
        @users = User.all
      end
    end
  end

end
