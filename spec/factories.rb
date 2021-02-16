FactoryBot.define do
  factory :variant, class: Variant do 
    price {1000}
    quantity {10}
    gender {'male'}
    color {'black'}
    size {'small'}
    brand_name {'brand'}
  end
end