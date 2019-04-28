require 'pry'

class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :not_authorized!, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @guides = @user.guides
    else
      @guides = Guide.all
    end
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.user = current_user
    if @guide.save
      flash[:message] = "#{@guide.title} was successfully added."
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def show
    @rating = Rating.new
  end
  end

  def edit
  end

  def update
    if @guide.update(guide_params)
      flash[:message] = "#{@guide.title} was successfully edited."
      redirect_to guide_path(@guide)
    end
  end

  def destroy
    if @guide.destroy
      flash[:message] = "#{@guide.title} was successfully deleted."
      redirect_to guides_path
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :summary, :destination_id)
  end

  def set_guide
    @guide = Guide.find_by(id: params[:id])
  end

  def not_authorized!
    if @guide.user != current_user
      flash[:message] = "You can only make changes to your own guide."
      redirect_to '/guides'
    end
  end

end
