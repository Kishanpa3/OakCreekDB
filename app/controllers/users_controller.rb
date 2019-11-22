class UsersController < ApplicationController
  def index
    respond_to do |format|
      params[:approved] === "false" ? format.html { render 'users/index-unapproved' } : format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end

  def destroy
  end

  def update
    if params[:users]
      User.update(params[:users].keys, params[:users].values)
    else
      puts 'NO USERS PROVIDED'
    end
  end
  
  
  def serve_index_partial
    puts "REQUEST FOR PARTIAL #{params}"
    render json: { html: render_to_string(partial: 'users/update', locals: {:user => params}) }
  end
end
