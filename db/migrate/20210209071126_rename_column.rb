# frozen_string_literal: true

class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :payment, :quantity
  end
end
