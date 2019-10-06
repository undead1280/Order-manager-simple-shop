require "rails_helper"

RSpec.describe OrderItemsController, type: :controller do
  let(:user) { FactoryBot.create(:userWithProduct) }
  let(:productId) { user.products.last.id }
  let(:productOrder) { user.products.last.order_items.create(content: "Order") }

  it "Create order" do
    expect do
      post :create, xhr: true, params: {product_id: productId, order_item: {content: "CreateOrder"}}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:create)
    end
  end
end
