class Veterinarian < ApplicationRecord
  has_secure_password

  has_many :pets
  has_many :owner, through: :pets
end
