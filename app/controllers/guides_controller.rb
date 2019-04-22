class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new
    if @guide.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def guide_params
    params.require(:guide).permit(:location, :summary)
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

end
