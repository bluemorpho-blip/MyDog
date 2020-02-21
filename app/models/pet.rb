class Pet < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :veterinarian
  has_many :meds

  validates :name, uniqueness: {scope: :user_id}

end