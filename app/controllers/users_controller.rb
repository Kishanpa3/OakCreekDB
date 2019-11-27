class UsersController < ApplicationController
  before_action :authenticate_admin, except: :update_form_partial
    
  private
    def authenticate_admin
       redirect_to '/', alert: 'You are not authorized to view this page. Redirected to home page.' unless current_user.admin?
    end
  
  
  public
    def index
      respond_to do |format|
        params[:approved] === "false" ? format.html { render 'users/index-unapproved' } : format.html
        format.json { render json: UserDatatable.new(view_context) }
      end
    end
    
    def update
      if params[:users]
        User.update(params[:users].keys, params[:users].values)
      else
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "User '#{@user.first_name} #{@user.last_name}' successfully deleted."
      redirect_to users_index_path approved: params[:approved]
    end
    
    def serve_index_partial
      render json: { html: render_to_string(partial: 'users/update', locals: {:user => params}) }
    end
end
