class GuidesController < ApplicationController

  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, only: [:edit, :update, :destroy]

  def index
    # if params[:user_id]
    #   @user = User.find_by(params[:user_id])
    #   @guides = @user.guides
    # else
    #   @guides = Guide.all
    # end
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.user_id = current_user.id
    if @guide.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def show
    @guide = Guide.find(params[:id])
  end

  def edit
  end

  def update
    if @guide.update(guide_params)
      flash[:message] = "Successfully edited."
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def destroy
    if @guide.destroy
      flash[:message] = "Successfully deleted."
      redirect_to guides_path
    else
      render :edit
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :summary, :destination_id)
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def redirect_if_not_authorized!
    if @guide.user_id != current_user.id
      redirect_to '/guides'
    end
  end

end
