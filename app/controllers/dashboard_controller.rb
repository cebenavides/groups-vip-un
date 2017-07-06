class DashboardController < ApplicationController
	before_action :authenticate_admin

	def users
	  if params[:approved] == "false"
		@users = User.where(approved: false).order(:group_id)
	  else
	  	@users = User.all
	  end
  	end
  	
  	def profile
  	  @admin = current_admin
  	end
  	
  	def update
  	  @admin = current_admin
  	  if @admin.update(group_params)
		redirect_to root_path
	  else
	    render :profile
	  end
	end

  	def approve
  	  user = User.find(params[:user])
  	  if user.update(approved: true)
  	    redirect_to dashboard_users_path
  	  end
  	end

  	private  
  	  def group_params
        params.require(:admin).permit(:name, :position, :avatar)
      end
      
	  def authenticate_admin
	    redirect_to '/', alert: 'Not authorized.' unless current_admin
	  end
end