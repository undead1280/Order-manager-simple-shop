require "rails_helper"

RSpec.describe CartsController, type: :controller do
  describe "GET show" do
    it "unauthenticated access" do
      sign_in nil
      get :show
      expect(response).to redirect_to(new_user_session_path)
    end
    it "authenticated access" do
      sign_in
      get :show
      expect(response.status).to eq(200)
    end
  end
  describe "routing to carts" do
    it "route to carts#show" do
      expect(get: "/cart").to route_to(
        controller: "carts",
        action: "show",
      )
    end
  end
end
