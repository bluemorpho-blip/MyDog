class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  def index
    @owners = Owner.all
  end

  # GET /owners/1
  def show

  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  def create
    if (@owner = Owner.new(owner_params))
    if @owner.save
      session[:owner_id] = @owner.id
      # flash[:message] = ' Welcome, #{@owner.name}'
      redirect_to owner_path(@owner)
    else
      render :new
    end
    else
      flash[:message] = "There was an error creating the owner."
      redirect_to signup_path
    end
  end

  # PATCH/PUT /owners/1
  def update
    if @owner.update(owner_params)
      redirect_to @owner, notice: 'Owner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /owners/1
  def destroy
    @owner.destroy
    redirect_to owners_url, notice: 'Owner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def owner_params
      params.require(:owner).permit(:name, :email, :phone_number, :contact_method, :password_digest, :admin)
    end
end
