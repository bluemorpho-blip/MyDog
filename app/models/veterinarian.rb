class Veterinarian < ApplicationRecord
  has_secure_password

  has_many :pets
  has_many :users, through: :pets

  validates :name, uniqueness: true

end
