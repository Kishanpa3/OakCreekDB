require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before (:each) do
    admin = User.create(first_name: "Admin",
      last_name: "Adminn",
      email: "admin@admin.com",
      password:              "adminnn",
      password_confirmation: "adminnn",
      admin:    true,
      approved: true,
      confirmed_at: Time.zone.now)
      
    sign_in admin
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    user = User.create(first_name: "User",
      last_name: "Userr",
      email: "user@user.com",
      password:              "userrr",
      password_confirmation: "userrr",
      admin:    false,
      approved: true,
      confirmed_at: Time.zone.now)
    
    it "returns http success" do
      get :destroy, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
