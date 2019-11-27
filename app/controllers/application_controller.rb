class ApplicationController < ActionController::Base
  include ApplicationHelper
   
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :update_form_partial

  
  # Used for updating the partials on the login page
  def update_form_partial
    case params[:form]
      when "sign_up"
        render json: { html: render_to_string(partial: 'devise/shared/form_partials/sign_up') }
      when "confirm"
        render json: { html: render_to_string(partial: 'devise/shared/form_partials/confirm') }
      when "reset"
        render json: { html: render_to_string(partial: 'devise/shared/form_partials/reset') }
      else
        redirect_to "/users/sign_in"
    end
  end
  
  
#AUTHENTICATION HELPERS FOR ABSTRACTING PERMISSION CHECKS
  def authenticate_admin
    redirect_back(fallback_location: '/', alert: 'You are not authorized to VIEW this page  - Please contact an adminstrator if this is incorrect.') unless current_user.admin?
  end
    
  def authenticate_view_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to VIEW this page  - Please contact an adminstrator if this is incorrect.') unless has_view_permissions
  end
  
  def authenticate_add_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to ADD content - Please contact an adminstrator if this is incorrect.') unless has_add_permissions
  end
  
  def authenticate_edit_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to EDIT content - Please contact an adminstrator if this is incorrect.') unless has_edit_permissions
  end
  
  def authenticate_delete_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to DELETE content - Please contact an adminstrator if this is incorrect.') unless has_delete_permissions
  end
end
