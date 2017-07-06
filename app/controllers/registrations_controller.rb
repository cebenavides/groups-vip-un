class RegistrationsController < Devise::RegistrationsController
  private
	  def sign_up_params
	    params.require(:user).permit(:email, :password, :password_confirmation, :group_id, :avatar, :name, :position, :site)
	  end

	  def account_update_params
	    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :group_id, :avatar, :name, :position, :site)
	  end
end