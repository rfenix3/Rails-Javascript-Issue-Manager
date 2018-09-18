class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def new
    @user = User.new
    @users = User.all
  end
  
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #byebug
      redirect_to user_path(@user), notice: "Welcome back to issue manager!"
    else
      # byebug
      # @user = User.new
      # @users = User.all
      # if params[:name].nil?
      #   @user.errors.add(:name, "cannot be blank.")
      # end
      # if params[:password].nil? 
      #   @user.errors.add(:password, "cannot be blank.")
      # end
      # if !params[:password].nil? 
      #   @user.errors.add(:password, "is wrong.")
      # end
      #render :new
      redirect_to signin_path
    end
  end
  
end
  