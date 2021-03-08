# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :variants, dependent: :destroy 
  validates :category, presence: true
end
