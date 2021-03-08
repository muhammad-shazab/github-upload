require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
  	before(:each) do
  		@product=Product.create(category: 'shirt')
  	end
  	it 'ensures category presence' do
  		product=Product.new().save
  		expect(product).to eq(false)
   	end
  end
end
