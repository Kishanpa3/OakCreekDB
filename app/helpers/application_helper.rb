module ApplicationHelper
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
  
  def no_content_for(symbol)
    # content can't be an empty string, so fill it with nbsp symbol
    content_for(symbol) do 
      ' &nbsp '
    end  
  end
end
