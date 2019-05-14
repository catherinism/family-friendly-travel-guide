class SessionsController < ApplicationController

  #render log in form
  def new
    # @user = User.new
    # render :new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.name}!"
      redirect_to guides_path
    else
      flash[:message] = "The information you provided does not match our records. Please re-enter your login information or signup."
      redirect_to login_path
    end
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id

    if logged_in?
          flash[:message] = "Successfully authenticated via Facebook."
        else
          flash[:message] = "Something went wrong. Try again."
        end
        redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
