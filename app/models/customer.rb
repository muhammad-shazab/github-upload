# frozen_string_literal: true

class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< Updated upstream

  has_many :orders
=======
>>>>>>> Stashed changes
end
