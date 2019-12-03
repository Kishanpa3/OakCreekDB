class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
  
  
  # AUTHENTICATION HELPERS FOR ABSTRACTING PERMISSION CHECKS
  def authenticate_admin
    redirect_back(fallback_location: '/', alert: 'You are not authorized to view this page  - Please contact an adminstrator if this is incorrect.') unless current_user.admin?
  end
    
  def authenticate_view_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to view this page  - Please contact an adminstrator if this is incorrect.') unless has_view_permissions
  end
  
  def authenticate_add_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to add content - Please contact an adminstrator if this is incorrect.') unless has_add_permissions
  end
  
  def authenticate_edit_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to edit content - Please contact an adminstrator if this is incorrect.') unless has_edit_permissions
  end
  
  def authenticate_delete_permissions
    redirect_back(fallback_location: '/', alert: 'You are not authorized to delete content - Please contact an adminstrator if this is incorrect.') unless has_delete_permissions
  end
  
  
  
  # Define custom paginate renderer for will_paginate
  def custom_paginate_renderer
    # Return nice pagination
    Class.new(WillPaginate::ActionView::LinkRenderer) do
    def container_attributes
      {class: "pagination justify-content-center"}
    end
  
    def page_number(page)
      if page == current_page
        "<li class=\"page-item active\">"+link(page, page, rel: rel_value(page), class: "page-link")+"</li>"
      else
        "<li class=\"page-item\">"+link(page, page, rel: rel_value(page), class: "page-link")+"</li>"
      end
    end
  
    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, "Previous")
    end
  
    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, "Next")
    end
  
    def previous_or_next_page(page, text)
      if page
        "<li class=\"page-item\">"+link(text, page, rel: rel_value(page), class: "page-link")+"</li>"
      else
        "<li class=\"page-item disabled\">"+link(text, '#', class: "page-link")+"</li>"
      end
    end
    end
  end
end
