class UsersController < ApplicationController
  def index
    @users = User.where(approved: true)
  end

  def destroy
  end

  def update
  end
end
