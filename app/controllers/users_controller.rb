class UsersController < ApplicationController

  #loading the signup platforms
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      redirect_to guides_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user, :username, :password)
  end

end
