class UsersController < ApplicationController
  def index
    if params[:approved] === "false"
      @users = User.where(approved: false)
      render('users/index-unapproved')
    else
      @users = User.where(approved: true)
    end
  end

  def destroy
  end

  def update
  end
end
