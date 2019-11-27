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
end
