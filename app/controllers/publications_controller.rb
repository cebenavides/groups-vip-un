class PublicationsController < ApplicationController
  before_action :set_group, except: [:index]
  before_action :authenticate_user, except: [:index]
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  def index
    @publications = Publication.all
  end


  # GET /publications/new
  def new    
    @publication = @group.publications.build
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
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
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group) }
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end
    
    def set_group
      @group = Group.friendly.find(params[:group_id])
    end
    
    def authenticate_user
        redirect_to '/', alert: 'Not authorized.' unless (current_user && current_user.group == @group) || current_admin
    end

    def publication_params
      params.require(:publication).permit(:name, :link, :group_id)
    end
end
