class UsersController < ApplicationController
  def index
    if params[:approved] === "false"
      @users = User.where("approved = ? AND confirmed_at IS NOT NULL", false)
      render('users/index-unapproved')
    else
      @users = User.where(approved: true)
    end
  end

  def destroy
  end

  def update
    if params[:users]
      User.update(params[:users].keys, params[:users].values)
      
      # params[:users].each_pair do |user_id, attr_vals|
      #   # puts user_id
      #   # puts attr_vals
      #   # puts attr_vals["admin"]
      #   @user = User.find(user_id)
      #   attr_vals.each_pair do |attribute, val|
      #     # puts "#{attribute}=#{val}"
      #     @user.send("#{attribute}=", val)
      #     @user.save!
          
      #     # @user.update_column!(attribute, val)
      #   end
      # end
    else
      puts 'NO USERS PROVIDED'
    end
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
end
