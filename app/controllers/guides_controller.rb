class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find_by(params[:user_id])
      @guides = @user.guides
    else
      @guides = Guide.all
    end
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.create(guide_params)
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
    if @guides.update(guide_params)
      flash[:message] = "Successfully edited."
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def destroy
    if @guides.destroy
      flash[:message] = "Successfully deleted."
      redirect_to guides_path
    else
      render :edit
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:location, :summary)
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def redirect_if_not_authorized!
    if @guide != current_user
      redirect_to '/guides'
    end
  end

end
