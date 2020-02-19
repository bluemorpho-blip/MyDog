class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  def show
    @veterinarian = Veterinarian.find_by(params[:veterinarian_id])
    @user = User.find_by(params[:user_id])
    @meds = Med.find_by(params[:pet_id])
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @user = current_user
    @veterinarians = Veterinarian.all
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
    redirect_to pets_url, notice: 'Pet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:name, :dog_cat, :breed, :veterinarian_id, :user_id)
    end
end
