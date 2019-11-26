require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do

  before (:each) do
    
    @animal = Animal.create(habitat_num:"32", 
    common_name:"Brown Bear", name:"Otto", 
    tag: "BBO001", 
    species: "Ursus Arctos", 
    weight: 325, sex: "Male", 
    neutered: "Yes", 
    age: 3, 
    dob: Time.new(2016,1,20))
    
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

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @animal.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: @animal.id }
      expect(response).to have_http_status(:success)
    end
  end

end
