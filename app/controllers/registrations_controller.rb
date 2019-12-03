class RegistrationsController < Devise::RegistrationsController
  # FOR DEVISE: USED TO ENFORCE FIRST/LAST NAME UPON USER SIGNUP - overriding devise methods

private
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end