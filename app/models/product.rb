<<<<<<< Updated upstream
# frozen_string_literal: true

=======
>>>>>>> Stashed changes
class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  validates :category, presence: true
end
