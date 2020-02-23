class User < ApplicationRecord
  has_secure_password

  has_many :pets, :dependent => :destroy
  has_many :veterinarians, through: :pets
  has_many :meds, :dependent => :destroy

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  def veterinarian
    User.each do |user|
      if user.admin
        @veterinarian = user
      end
    end
  end

end
