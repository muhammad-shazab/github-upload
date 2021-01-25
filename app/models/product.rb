class Product < ApplicationRecord
	has_many :variants, dependent: :destroy
	validates :category, presence: true
	accepts_nested_attributes_for :variants

end
