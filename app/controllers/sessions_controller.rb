class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def new
    @user = User.new
    #@users = User.all
  end
  
  def create
    if request.env["omniauth.auth"]
      # They login via OAuth
      byebug
      oauth_email = request.env["omniauth.auth"]["info"]["nickname"]
      if @user = User.find_by(:name => oauth_email)
        byebug
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome back to issue manager!"
      else
        # Default password is set to 'guest' for Github user
        byebug
        @user = User.new(:name => oauth_email, :password => "guest", :role => "Guest")
        if @user.save
          byebug
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome back to issue manager!"
        else
          byebug
          redirect_to signin_path
        end
      end
    else
      # Normal login with user name and password
      @user = User.find_by(name: params[:user][:name])
      #byebug
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        #byebug
        redirect_to user_path(@user), notice: "Welcome back to issue manager!"
      else
        #byebug
        @user.errors.add(:password, "Username and Password must match or exist")
        render template: "sessions/new"
        #redirect_to sessions_new_path
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :password
    )
  end
  
end
  