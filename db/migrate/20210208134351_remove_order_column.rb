# frozen_string_literal: true

class RemoveOrderColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :customer
    remove_column :orders, :color
    remove_column :orders, :name
    remove_column :orders, :quantity
    remove_column :orders, :gender
  end
end
