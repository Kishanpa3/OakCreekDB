module ApplicationHelper
  
#DEVISE HELPERS FOR ACCESSING DEVISE RESOURCES OUTSIDE OF DEVISE CONTROLLER/VIEWS
  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def resource_class
    devise_mapping.to
  end


#PERMISSON HELPERS FOR ABSTRACTING PERMISSION CHECKS
  def authenticate_admin
    redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless current_user.admin?
  end
    
  def has_view_permissions
    _can_view = current_user.admin? || current_user.can_view?
    redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless _can_view?
  end
  
  def has_add_permissions
    _can_add = current_user.admin? || current_user.can_add?
    redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless _can_add?
  end
  
  def has_edit_permissions
    _can_edit = current_user.admin? || current_user.can_edit?
    redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless _can_edit?
  end
  
  def has_delete_permissions
    _can_delete = current_user.admin? || current_user.can_delete?
    redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless _can_delete?
  end
end
