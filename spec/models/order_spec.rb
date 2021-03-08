require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validation test' do  
  	before(:each) do
  		@product=Product.create(category: 'Shirts')
  		@customer=Customer.create(email: 'muhammadshazab98@gmail.com',encrypted_password: 'ljaslwne34kjh0-23n3')       		
      @variant=Variant.new(price: 1000,color: 'pink', quantity: 10, gender: 'male', size: 'small', brand_name: 'new',product_id: @product.id)
      @variant.product_image.attach(
        io: File.open(Rails.root.join('app','assets', 'images', 'elo.png')),
        filename: 'elo.png',
        content_type: 'image/png'
      )
      @variant.save
      @order=Order.create(quantity: 3,customer_id: @customer.id, variant_id: @variant.id) 
    end
  	it 'ensures quantity presence' do
  		order=Order.new(variant_id: @variant.id, customer_id: @customer.id).save
  		expect(order).to eq(false)
   	end

     it { expect(@order).to respond_to(:update_quantity) }
  end
end
