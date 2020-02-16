class Pet < ApplicationRecord
  belongs_to :owner
  belongs_to :veterinarian
  has_many :meds
end
