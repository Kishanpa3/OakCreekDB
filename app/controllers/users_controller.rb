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
end
