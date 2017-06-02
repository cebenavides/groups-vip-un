class DashboardController < ApplicationController
	before_action :authenticate_admin

	def users
	  	if params[:approved] == "false"
	  		@users = User.where(approved: false).order(:group_id)
	  	else
	  		@users = User.all
	  	end
  	end

  	def approve
  		user = User.find(params[:user])
  		if user.update(approved: true)
  			redirect_to dashboard_users_path, notice: 'User approved.'
  		end
  	end

  	private  
		def authenticate_admin
	    	redirect_to '/', alert: 'Not authorized.' unless current_user && current_user.admin?
	  	end
end