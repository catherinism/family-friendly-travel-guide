require 'pry'

class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :not_authorized!, only: [:edit, :update, :destroy]

  def index
    if !params[:destination_id].blank?
      #binding.pry
      @destination_id = Destination.find_by(id: params[:destination_id]).id
      @guides = Guide.where(destination_id: @destination_id)
    else
      @guides = Guide.all
    end
  end

  def rated
    @guides = Guide.rated
    render action: :index
  end

  def new
    @guide = current_user.guides.build
    # @guide.destination_id = Destination.new
    #@guide.user_id = current_user.id
    #@destinations = Destination.all.map { |d| [d.location, d.id] }
  end

  def create
    @guide = current_user.guides.build(guide_params)
    # @guide.destination_id = params[destination_id]
    @guide.user_id = current_user.id
    if @guide.save
      flash[:message] = "#{@guide.title} was successfully added."
      redirect_to guide_path(@guide)
    else
      flash[:message] = "#{@guide.errors.full_messages.to_sentence}."
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
      if !logged_in?
    #@rating = Rating.new
      flash[:message] = "Log in to view the details."
      redirect_to login_path

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
      params.require(:guide).permit(
        :title,
        :summary,
        :lodging,
        :itinerary,
        :destination_location,
        :airport,
        :baby_gear_rental,
        :park,
        :zoo,
        :restaurant,
        :luggage_storage,
        :image)
    end

  def set_guide
    @guide = Guide.find_by(id: params[:id])
  end

  def not_authorized!
    if @guide.user_id != current_user.id
      flash[:message] = "You can only make changes to your own guide."
      redirect_to '/guides'
    end
  end

end
