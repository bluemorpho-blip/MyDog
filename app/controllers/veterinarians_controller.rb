class VeterinariansController < ApplicationController
  before_action :set_veterinarian, only: [:show, :edit, :update, :destroy]

  # GET /veterinarians
  def index
    @veterinarians = Veterinarian.all
  end

  # GET /veterinarians/1
  def show
  end

  # GET /veterinarians/new
  def new
    @veterinarian = Veterinarian.new
  end

  # GET /veterinarians/1/edit
  def edit
  end

  # POST /veterinarians
  def create
    @veterinarian = Veterinarian.new(veterinarian_params)

    if @veterinarian.save
      redirect_to @veterinarian, notice: 'Veterinarian was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /veterinarians/1
  def update
    if @veterinarian.update(veterinarian_params)
      redirect_to @veterinarian, notice: 'Veterinarian was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /veterinarians/1
  def destroy
    @veterinarian.destroy
    redirect_to veterinarians_url, notice: 'Veterinarian was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veterinarian
      @veterinarian = Veterinarian.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def veterinarian_params
      params.require(:veterinarian).permit(:name, :admin, :email, :password)
    end

end
