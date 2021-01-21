class Product < ApplicationRecord
	has_many :variants, dependent: :destroy
	validates :category, presence: true
	accepts_nested_attributes_for :variants
	attr_accessor :counter 
	def counter=(counter)
	  @counter = counter
	end

	def counter
	  @counter
	end

end
