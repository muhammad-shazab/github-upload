# frozen_string_literal: true

class Variant < ApplicationRecord
  belongs_to :product
  has_many :orders
  has_one_attached :product_image

  validates :price, presence: true
  validates :quantity, presence: true
  validates :gender, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :brand_name, presence: true
  validates :product_image, presence: true
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validates :product_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  #               size: { less_than: 1.megabytes , message: 'is not given between size' }
end
