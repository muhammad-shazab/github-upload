# frozen_string_literal: true

class AddCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :customer, :integer
  end
end
