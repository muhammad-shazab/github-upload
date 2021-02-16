require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
  	it 'ensures category presence' do
  		product=Product.new().save
  		expect(product).to eq(false)
   	end
  end
end
