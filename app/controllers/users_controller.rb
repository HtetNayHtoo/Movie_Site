class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /users or /users.json
  def index
    @users = UserService.index
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = UserService.new
  end

  # GET /users/1/edit
  def edit
  end

  def confirm
   @user = UserService.create_user(user_params)
    render :new if @user.invalid?
  end

  # POST /users or /users.json
  def create
    @user = UserService.create_user(user_params)
    isSave = UserService.create(user_params)

    respond_to do |format|
      if isSave
        format.html { redirect_to login_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    isUpdate = UserService.update(params[:id],user_params)
    respond_to do |format|
      if isUpdate
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy

    UserService.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = UserService.set_user(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :user_type, :email, :password, :phone, :address, :dob, :profile_img)
    end
end
