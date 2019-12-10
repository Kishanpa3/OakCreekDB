class ErrorsController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
      # format.js { render :js => "window.location = '#{error_not_found_path}'" }
    end
  end

  def unacceptable
    respond_to do |format|
      format.html { render status: 422 }
      # format.js { render status: 422 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render status: 500 }
      # format.js { render status: 500 }
    end
  end
end
