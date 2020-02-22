class Med < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :name, uniqueness: {scope: :pet_id}

end
