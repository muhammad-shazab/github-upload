# require 'rails_helper'

# RSpec.describe Admin::AdminProductsController, type: :controller do

#   # describe "GET index" do
#   #   it "assigns @products" do
#   #     product = Product.create
#   #     get :index
#   #     expect(assigns(:products)).to eq([product])
#   #   end

#   #   it "renders the index template" do
#   #     get :index
#   #     expect(response).to render_template("index")
#   #   end
#   # end

#   describe "Post Create" do
#     it 'create new product' do
#       get :index
#       #post :create, params: {}
#       within('#addproduct') do
#         find("button", text: "Add New Products Category").click
#         fill_in "category", with: "trousers"
#       end
      
#       expect { find("button", text: "Add Product Category").click }.to change(Product, :count).by(1)
#     end
#   end

#   # describe "success" do
#   #   before :each do
#   #     @product=FactoryBot.create(:product)
#   #   end
#   #     it "should delete a product" do
#   #     get :index
#   #     page.should have_link("Remove Product")
#   #     expect { click_link "Remove Product" }.to change(Product, :count).by(-1)
#   #   end
#   # end
# end
