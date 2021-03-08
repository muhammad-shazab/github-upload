FactoryBot.define do
  factory :variant, class: Variant do 
    price {1000}
    quantity {10}
    gender {'male'}
    color {'black'}
    size {'small'}
    brand_name {'brand'}
    product_image { Rack::Test::UploadedFile.new('app/assets/images/elo.png', 'image/png') }
    association :product
  end
end