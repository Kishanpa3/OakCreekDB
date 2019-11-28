class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
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
