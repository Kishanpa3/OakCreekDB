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
end
