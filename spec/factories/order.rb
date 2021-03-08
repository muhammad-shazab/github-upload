FactoryBot.define do
  factory :order, class: Order do 
    quantity {1}
    association :variant
    association :customer
  end
end