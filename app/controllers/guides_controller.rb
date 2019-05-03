require 'pry'

class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :not_authorized!, only: [:edit, :update, :destroy]

  def index
    if params[:destination].blank?
      @guides = Guide.all
    else
      @destination_id = Destination.find_by(id: params[:location_id]).id
      @guides = Destination.where(destination_id: @destination_id)
    end
  end

  def new
    @guide = current_user.guides.build
    @destinations = Destination.all.map { |d| [d.location, d.id] }
  end

  def create
    @guide = current_user.guides.build(guide_params)
    @guide.destination_id = params[destination_id]
    if @guide.save
      flash[:message] = "#{@guide.title} was successfully added."
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def show
      if !logged_in?
    #@rating = Rating.new
      flash[:message] = "Log in to view the details."
      redirect_to root_path
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
