require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validation test' do
  	before(:each) do
  		@product=Product.create(category: 'Shirts')
  		@customer=Customer.create(email: 'muhammadshazab98@gmail.com',encrypted_password: 'ljaslwne34kjh0-23n3')
  		@variant=Variant.create(price: 1000,color: 'pink', quantity: 10, gender: 'male', size: 'small', brand_name: 'new',product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id)
  	end
  	it 'ensures quantity presence' do
  		order=Order.new(variant_id: @variant.id, customer_id: @customer.id).save
  		expect(order).to eq(false)
   	end
  end
end
