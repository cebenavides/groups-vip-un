class PagesController < ApplicationController  
  before_action :set_page, only: [:show, :edit, :update, :destroy]  
  before_action :set_group
  before_action :authenticate_user, except: [:show]

  # GET /pages
  def index
    @pages = @group.pages
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = @group.pages.build
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = @group.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_path(@page) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_path(@page) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group) }      
    end
  end

  private
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    def set_group
      if params[:group_id]
        @group = Group.friendly.find(params[:group_id])
      else
        @group = @page.group
      end
    end

    def page_params
      params.require(:page).permit(:title, :content, :group_id)
    end
    
    def authenticate_user
      redirect_to '/', alert: 'Not authorized.' unless (current_user && current_user.group == @group) || current_admin
    end
end