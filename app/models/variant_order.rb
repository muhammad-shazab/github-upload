# frozen_string_literal: true

class VariantOrder < ApplicationRecord
  belongs_to :variant
  belongs_to :order
end
