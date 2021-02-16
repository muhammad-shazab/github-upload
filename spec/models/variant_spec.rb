require 'rails_helper'

RSpec.describe Variant, type: :model do
  context 'validation test' do
    before(:each) do
      @product=Product.create(category: 'Shirts')
      @variant=build(:variant)
      @variant.product_image.attach(
        io: File.open(Rails.root.join('assets', 'images', 'elo.png')),
        filename: 'elo.png',
        content_type: 'image/png'
      )
    end
  
  	it 'ensures color presence' do	
  		@variant.product_id: @product.id).save
      
      expect(@variant).to eq(false)
   	end
   	# it 'ensures price presence' do
  		# @variant=Variant.new(color: 'pink', quantity: 10, gender: 'male', size: 'small',brand_name: 'something', product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id).save
  		# expect(@variant).to eq(false)
   	# end
   	# it 'ensures gender presence' do
  		# variant=Variant.new(price: 1000, quantity: 10, color: 'black', size: 'small', brand_name: 'something',product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id).save
  		# expect(variant).to eq(false)
   	# end
   	# it 'ensures size presence' do
  		# variant=Variant.new(price: 1000, quantity: 10, gender: 'male', color: 'yellow',brand_name: 'something', product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id).save
  		# expect(variant).to eq(false)
   	# end
   	# it 'ensures quantity presence' do
  		# variant=Variant.new(price: 1000, color: 'pink', gender: 'male', size: 'small', brand_name: 'something',product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id).save
  		# expect(variant).to eq(false)
   	# end
   	# it 'ensures brand_name presence' do
  		# variant=Variant.new(price: 1000, quantity: 10, gender: 'male', size: 'small',color: 'pink', product_image: '/home/muhammadshazab/workspace/shoppingapp/app/assets/images/elo.png',product_id: @product.id).save
  		# expect(variant).to eq(false)
   	# end
   	# it 'ensures product_image presence' do
  		# variant=Variant.new(price: 1000, quantity: 10, gender: 'male', size: 'small',color: 'pink', brand_name: 'something'  ,product_id: @product.id).save
  		# debugger
    #   expect(variant).to eq(false)
   	# end
   end
end
