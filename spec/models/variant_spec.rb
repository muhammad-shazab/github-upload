require 'rails_helper'

RSpec.describe Variant, type: :model do
  context 'validation test' do
    before(:each) do
      @product=FactoryBot.create(:product)
      @variant=Variant.new(price: 1000, gender: 'male', quantity: 10,color: 'black', size: 'small', brand_name: 'something',product_id: @product.id)
      @variant.product_image.attach(
        io: File.open(Rails.root.join('app','assets', 'images', 'elo.png')),
        filename: 'elo.png',
        content_type: 'image/png'
      )
    end
  
  	it 'ensures color presence' do
      @variant.color = nil	
      expect(@variant.save).to eq(false)
   	end
    it 'ensures size presence' do
      @variant.size = nil  
      expect(@variant.save).to eq(false)
    end
    it 'ensures gender presence' do
      @variant.gender = nil  
      expect(@variant.save).to eq(false)
    end
    it 'ensures quantity presence' do
      @variant.quantity = nil  
      expect(@variant.save).to eq(false)
    end
    it 'ensures price presence' do
      @variant.price = nil  
      expect(@variant.save).to eq(false)
    end
    it 'ensures brand_name presence' do
      @variant.brand_name = nil  
      expect(@variant.save).to eq(false)
    end
    it 'ensures product_image presence' do
      @variant.product_image = nil  
      expect(@variant.save).to eq(false)
    end

    it { expect(@variant).to validate_numericality_of(:price) }
   	
   end
end
