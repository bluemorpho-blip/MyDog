module MedsHelper

  def pet_name
    pet = Pet.find_by(params[:pet_id])
    pet.name
  end
end
