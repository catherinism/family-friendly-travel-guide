class RatingsController < ApplicationController
  before_action :find_guide, except: [:rated]
  before_action :find_rating, only: [:edit, :update, :destroy]

  def new
    @rating =Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.guide_id = @guide.id
    @rating.user_id = current_user.id

    if @rating.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rating.update(rating_params)
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def destroy
    @rating.destroy
    redirect_to guide_path(@guide)
  end

  private

    def rating_params
      params.require(:rating).permit(:value)
    end

    def find_guide
      @guide = Guide.find(params[:guide_id])
    end

    def find_rating
      @rating = Rating.find(params[:id])
    end

end
