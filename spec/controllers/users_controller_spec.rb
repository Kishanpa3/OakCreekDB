require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before (:each) do
    @user = FactoryBot.create(:user)
      
    sign_in @user
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    
    it "returns http success" do
      sign_in FactoryBot.create(:user)
      delete :destroy, params: { id: user2.id }
      expect(response).to redirect_to(users_index_path)
    end
  end

  describe "POST #update" do
    it "returns http success" do
      post :update, params: { id: @user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
