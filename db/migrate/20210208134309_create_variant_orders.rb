# frozen_string_literal: true

class CreateVariantOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_orders do |t|
      t.integer :order_id
      t.integer :variant_id

      t.timestamps
    end
  end
end
