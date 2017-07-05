class GroupsController < ApplicationController  
  before_action :authenticate_admin, only: [:index, :destroy]
  before_action :set_group, only: [:show, :edit, :update, :destroy, :list]
  before_action :authenticate_user, except: [:show, :index, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  def list
    @publications = @group.publications
  end

  # GET /groups/1
  def show
    @admin = Admin.first
    @users = @group.users.where(approved: true)
    @publications = @group.publications
    @pages = @group.pages
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /groups/1
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :avatar)
    end

    def authenticate_user
        redirect_to '/', alert: 'Not authorized.' unless (current_user && current_user.group == @group) || current_admin
    end

    def authenticate_admin
        redirect_to '/', alert: 'Not authorized.' unless current_admin
    end
end
