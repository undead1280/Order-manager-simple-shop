require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let(:productName) { "name" }

  describe "GET index" do
    it "unauthenticated access" do
      sign_in nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
    it "authenticated access" do
      sign_in
      get :index
      expect(response.status).to eq(200)
    end
  end
  context "actions testing" do
    before :each do
      sign_in
    end

    describe "GET new" do
      it "New product" do
        get :new, xhr: true
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end
    end

    it "Create product" do
      expect do
        post :create, xhr: true, params: {product: {name: productName}}
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:create)
      end
    end
  end
  describe "routing to products" do
    it "routes /products to products#index" do
      expect(get: "/products").to route_to(
        controller: "products",
        action: "index",
      )
    end
    it "routes /products/new to products#new" do
      expect(get: "/products/new").to route_to(
        controller: "products",
        action: "new",
      )
    end
    it "routes /products to products#create" do
      expect(post: "/products").to route_to(
        controller: "products",
        action: "create",
      )
    end
  end
end
