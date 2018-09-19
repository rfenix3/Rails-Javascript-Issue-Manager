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
    if request.env["omniauth.auth"]
      # They login via OAuth
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if @user = User.find_by(:name => oauth_email)
        session[:user_id] = @user.id
      else
        byebug
        @user = User.new(:name => oauth_email, :password => "guest", :role => "Guest")
        if @user.save
          session[:user_id] = @user.id
          byebug
          redirect_to user_path(@user), notice: "Welcome back to issue manager!"
        else
          byebug
          redirect_to signin_path
        end
      end
    else
      # Normal login with user name and password
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
  
end
  