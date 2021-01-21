class Variant < ApplicationRecord

	belongs_to :product
	has_one_attached :product_image
	validate :acceptable_image
	
	validates :price,:quantity,:gender,:color,:size, presence:true
	validates :price,:quantity, numericality:{only_integer:true,greater_than:0}

	def acceptable_image
	  return unless product_image.attached?
	  unless product_image.byte_size <= 1.megabyte
	    errors.add(:product_image, "is too big")
	  end
	  acceptable_types = ["image/jpeg", "image/png"]
	  unless acceptable_types.include?(product_image.content_type)
	    errors.add(:product_image, "must be a JPEG or PNG")
	  end
	end

	def self.search(search)
		where("lowercase(product.category) LIKE :search OR lowercase(variants.brand_name) LIKE :search ", search: "%#{search.downcase}%")
	end
end
