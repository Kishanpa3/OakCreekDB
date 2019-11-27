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
  def has_view_permissions
    _can_view = current_user.admin? || current_user.can_view?
  end
  
  def has_add_permissions
    _can_add = current_user.admin? || current_user.can_add?
  end
  
  def has_edit_permissions
    _can_edit = current_user.admin? || current_user.can_edit?
  end
  
  def has_delete_permissions
    _can_delete = current_user.admin? || current_user.can_delete?
  end
end
