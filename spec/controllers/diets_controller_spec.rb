require 'rails_helper'

RSpec.describe DietsController, type: :controller do
  before (:each) do
    
    @animal = FactoryBot.create(:animal)
    
    @animal.diet = Diet.create(dish: "bowl")
    
    @user = FactoryBot.create(:user)
      
    sign_in @user
  end
  

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { animal_id: @animal.id, id: @animal.diet.id }
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { animal_id: @animal.id, id: @animal.diet.id }
      expect(response).to have_http_status(:success)
    end
  end
end
