<<<<<<< Updated upstream
# frozen_string_literal: true

class Variant < ApplicationRecord
  belongs_to :product
  has_many :orders
  has_one_attached :product_image

  validates :price, :quantity, :gender, :color, :size, :product_image, presence: true
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validates :product_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  #               size: { less_than: 1.megabytes , message: 'is not given between size' }
=======
class Variant < ApplicationRecord
  belongs_to :product
  has_one_attached :product_image
  validate :acceptable_image

  validates :price, :quantity, :gender, :color, :size, presence: true
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }

  def acceptable_image
    return unless product_image.attached?

    errors.add(:product_image, 'is too big') unless product_image.byte_size <= 1.megabyte
    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:product_image, 'must be a JPEG or PNG') unless acceptable_types.include?(product_image.content_type)
  end
>>>>>>> Stashed changes
end
