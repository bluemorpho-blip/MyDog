class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.search(params[:search]) || @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1
  def show
    if (@user = User.find_by_id(params[:id]))
      authorize(@user)
    else
      not_authorized("only accessible to registered user")
    end
  end

  # POST /users
  def create
    @user = User.create(params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :contact_method, :password))
    session[:user_id] = @user.id
    redirect_to root_path
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'user was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit([:uid, :first_name, :last_name, :email, :phone_number, :contact_method, :password, :search])
    end
end
