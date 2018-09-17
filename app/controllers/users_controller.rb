class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all

  end 

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      byebug
      redirect_to user_path(@user), notice: "Welcome to Issue Manager!"
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   respond_to do |format|
  #      if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :role
      )
    end
end

