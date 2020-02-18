class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :veterinarian
  has_many :meds
end
