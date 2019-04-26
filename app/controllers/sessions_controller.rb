class SessionsController < ApplicationController

  #render log in form
  def new
    # @user = User.new
    # render :new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to guides_path
    else
      flash[:message] = "The information you provided does not match our records. Please re-enter your login information or signup."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
