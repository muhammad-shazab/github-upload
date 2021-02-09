# frozen_string_literal: true

class AddCoulmnOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :variant_id, :integer
    add_column :orders, :customer_id, :integer
  end
end
