class AddQuantity < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :quantity, :integer
  	rename_column :orders, :price, :payment
  end
end
