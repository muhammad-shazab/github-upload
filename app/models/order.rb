# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :variant
  validates :quantity, presence: true

  after_save :update_quantity

  def update_quantity
    var = variant
    new_quantity = var.quantity - quantity
    var.update_attribute(:quantity, new_quantity)
  end
end
