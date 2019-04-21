class SessionsController < ApplicationController

  #render log in form
  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:username])
      session[:id] = @user.id
      redirect_to guides_path
    else
      redirect_to 'login'
    end
  end


  def destroy
    session.clear
    redirect_to '/'
  end

end
