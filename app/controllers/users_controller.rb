class UsersController < ApplicationController
  def index
    respond_to do |format|
      params[:approved] === "false" ? format.html { render 'users/index-unapproved' } : format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end
  
  def update
    if params[:users]
      puts 'USERS PROVIDED'
      User.update(params[:users].keys, params[:users].values)
    else
      puts 'NO USERS PROVIDED'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.first_name} #{@user.last_name}' successfully deleted."
    redirect_to users_index_path approved: params[:approved]
  end
  
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

  def serve_index_partial
    puts "REQUEST FOR PARTIAL #{params}"
    render json: { html: render_to_string(partial: 'users/update', locals: {:user => params}) }
  end
end
