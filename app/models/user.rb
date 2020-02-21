class User < ApplicationRecord
  has_secure_password

  has_many :pets
  has_many :veterinarians, through: :pets
  has_many :meds

  validates :name, uniqueness: {message: "name already in use"}
  validates :email, uniqueness: {message: "email already in use"}
  validates :phone_number, uniqueness: {message: "phone number already in use"}
end
