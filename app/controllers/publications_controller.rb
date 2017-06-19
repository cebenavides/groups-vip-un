class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new    
    @group = Group.friendly.find(params[:group_id])
    @publication = @group.publications.build
  end

  # GET /publications/1/edit
  def edit
    @group = @publication.group
  end

  # POST /publications
  # POST /publications.json
  def create
    @group = Group.friendly.find(params[:group_id])
    @publication = @group.publications.build(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to group_path(@group) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    @group = Group.friendly.find(params[:group_id])
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to group_path(@group) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @group = @publication.group
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:name, :link, :group_id)
    end
end
