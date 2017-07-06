class GroupImagesController < ApplicationController
  before_action :set_group
  before_action :set_group_image, only: [:show, :edit, :update, :destroy]

  # GET /group_images
  def index
    @group_images = @group.group_images
  end

  # GET /group_images/new
  def new
    @group_image = @group.group_images.build
  end

  # GET /group_images/1/edit
  def edit
  end

  # POST /group_images
  def create
    @group_image = @group.group_images.build(group_image_params)

    if @group_image.save
      redirect_to group_group_images_path(@group)
    else
      render :new
    end
  end

  # PATCH/PUT /group_images/1
  def update
    if @group_image.update(group_image_params)
      redirect_to group_group_images_path(@group)
    else
      render :edit
    end
  end

  # DELETE /group_images/1
  def destroy
    @group_image.destroy
    redirect_to group_group_images_path(@group), notice: 'Group image was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_image
      @group_image = GroupImage.find(params[:id])
    end
    
    def set_group
      @group = Group.friendly.find(params[:group_id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_image_params
      params.require(:group_image).permit(:avatar)
    end
end
